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
    Widget canalTile(String title, String subtitle) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: const Icon(Icons.person),
          iconColor: Colors.white,
          textColor: Colors.white,
          trailing: const Icon(Icons.meeting_room_rounded),
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
            title: const Text('Canals'),
            foregroundColor: Colors.white,
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return canalTile('Canal $index', 'Description $index');
              }),
        ));
  }
}
