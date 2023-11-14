import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool hidden;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.hidden,
      required this.controller});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            width: 300,
            child: TextField(
                controller: widget.controller,
                cursorColor: Colors.white,
                cursorHeight: 20,
                cursorWidth: 1,
                obscureText: widget.hidden,
                keyboardType: TextInputType.text,
                style: const TextStyle(
                    color: Colors.white, decoration: TextDecoration.none),
                decoration: InputDecoration(
                  labelText: widget.label,
                  labelStyle: const TextStyle(color: Colors.white),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.white)),
                ))),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
