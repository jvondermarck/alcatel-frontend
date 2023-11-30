import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/bubble_card.dart';
import 'package:pushtotalk/components/bubble_creation_form.dart';
import 'package:geolocator/geolocator.dart';

class BubblesPage extends StatefulWidget {
  const BubblesPage({Key? key}) : super(key: key);

  @override
  State<BubblesPage> createState() => _BubblesPageState();
}

class _BubblesPageState extends State<BubblesPage> {
  @override
  void initState() {
    // print position
    _determinePosition().then((value) => print(value));
    super.initState();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  List<BubbleCard> bubbleList = [];
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Liste des canaux',
      body: RefreshIndicator(
        onRefresh: () async {
          _determinePosition().then((value) => print(value));
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: bubbleList.length,
            itemBuilder: (context, index) {
              return bubbleList[index];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BubbleCreationForm(
                    onBubbleCreated: (BubbleCard newBubble) {
                  setState(() {
                    bubbleList.add(newBubble);
                  });
                });
              });
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
