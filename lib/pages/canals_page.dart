import 'package:flutter/material.dart';
import 'package:pushtotalk/utils/colors.dart';

class CanalsPage extends StatefulWidget {
  const CanalsPage({super.key});

  @override
  State<CanalsPage> createState() => _CanalsPageState();
}

class _CanalsPageState extends State<CanalsPage> {
  @override
  Widget build(BuildContext context) {
    Widget canalCard(String title, String subtitle) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Card(
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: const Icon(Icons.person),
            iconColor: Colors.black,
            textColor: Colors.black,
            trailing: const Icon(Icons.meeting_room_rounded),
          ),
        ),
      );
    }

    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              primaryColor,
              primaryColorLight,
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Liste des canaux'),
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return canalCard('Canal $index', 'Description $index');
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Dialog "Recherche de canaux..."
                Dialog dialog = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: const SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Recherche de canaux...'),
                        SizedBox(
                          height: 40,
                        ),
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              },
              child: const Icon(Icons.radar_rounded, size: 32),
            )));
  }
}
