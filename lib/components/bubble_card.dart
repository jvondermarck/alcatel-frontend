import 'package:flutter/material.dart';
import 'package:pushtotalk/pages/voice_page.dart';

class BubbleCard extends StatefulWidget {
  final String title;
  final String subtitle;

  const BubbleCard({super.key, required this.title, required this.subtitle});

  @override
  State<BubbleCard> createState() => _BubbleCardState();
}

class _BubbleCardState extends State<BubbleCard> {
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
          trailing: GestureDetector(
              child: const Icon(Icons.meeting_room_rounded),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VoicePage(bubble: widget.title)));
              }),
        ),
      ),
    );
  }
}
