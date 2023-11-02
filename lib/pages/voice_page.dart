import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/utils/colors.dart';

class VoicePage extends StatefulWidget {
  final String bubble;

  const VoicePage({super.key, required this.bubble});

  @override
  State<VoicePage> createState() => _VoicePageState();
}

class _VoicePageState extends State<VoicePage> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Container(
          color: Colors.white,
          child: Center(
              child: ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isPressed = !isPressed;
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 300),
                  shape: const CircleBorder(),
                  backgroundColor: isPressed ? primaryColor : Colors.white,
                ),
                child: Icon(
                  isPressed ? Icons.mic : Icons.mic_off,
                  size: 200,
                  color: isPressed ? Colors.white : primaryColorLight,
                ),
              )
            ],
          )),
        ),
        title: widget.bubble);
  }
}
