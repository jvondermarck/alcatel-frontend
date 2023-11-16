import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/bubble_card.dart';
import 'package:pushtotalk/components/bubble_form_field.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BubblesPage extends StatefulWidget {
  const BubblesPage({Key? key}) : super(key: key);

  @override
  State<BubblesPage> createState() => _BubblesPageState();
}

class _BubblesPageState extends State<BubblesPage> {
  List<BubbleCard> bubbleList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  FlutterBluePlus flutterBluePlus = FlutterBluePlus();
  @override
  void initState() {
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: true);
    enableBLE();
    super.initState();
  }
  enableBLE() async {
    // check if BLE is supported
    if (await FlutterBluePlus.isSupported == false) {
      print("BLE is not supported by this device!");
      return;
    }

    // turn on bluetooth ourself if we can
    // for iOS, the user controls bluetooth enable/disable
    if (Platform.isAndroid) {
      await FlutterBluePlus.turnOn();
    }

    // wait bluetooth to be on
    // note: for iOS the initial state is typically BluetoothAdapterState.unknown
    await FlutterBluePlus.adapterState
        .where((s) => s == BluetoothAdapterState.on)
        .first;
  }
//-----------------------------Start the Scan-----------------------------
  startScan() async {
    FlutterBluePlus.startScan(
        timeout: const Duration(seconds: 4)); //Starts Scanning for Devices
  }
//-----------------------------Stop the Scan-----------------------------

  stopScan() {
    FlutterBluePlus.stopScan(); //Stop Scanning for Devices
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Liste des canaux',
      body: RefreshIndicator(
        onRefresh: () {
          return FlutterBluePlus.startScan(
              timeout:
                  const Duration(seconds: 4)); //Starts Scanning for Devices
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
              final formKey = GlobalKey<FormState>();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Création de la bulle',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          BubbleFormField(
                            title: 'Nom',
                            icon: Icons.title,
                            hint: 'Ex: titre super cool',
                            controller: titleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BubbleFormField(
                            title: 'Description',
                            icon: Icons.description,
                            hint: 'Ex: description tip top',
                            controller: subtitleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                if (formKey.currentState!.validate()) {
                                  String title = titleController.text;
                                  String subtitle = subtitleController.text;
                                  bubbleList.add(BubbleCard(
                                    title: title,
                                    subtitle: subtitle,
                                  ));
                                  Navigator.pop(context);
                                }
                              });
                              titleController.clear();
                              subtitleController.clear();
                            },
                            label: const Text('Valider'),
                            icon: const Icon(Icons.check),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}