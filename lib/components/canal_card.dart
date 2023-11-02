import 'package:flutter/material.dart';

class CanalCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const CanalCard({super.key, required this.title, required this.subtitle});

  @override
  State<CanalCard> createState() => _CanalCardState();
}

class _CanalCardState extends State<CanalCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          leading: const Icon(Icons.person),
          iconColor: Colors.black,
          textColor: Colors.black,
          trailing: const Icon(Icons.meeting_room_rounded),
        ),
      ),
    );
  }
}
