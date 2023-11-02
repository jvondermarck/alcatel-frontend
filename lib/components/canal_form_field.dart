import 'package:flutter/material.dart';

class CanalFormField extends StatefulWidget {
  const CanalFormField({
    super.key,
    required this.title,
    required this.hint,
  });

  final String title;
  final String hint;

  @override
  State<CanalFormField> createState() => _CanalFormFieldState();
}

class _CanalFormFieldState extends State<CanalFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.title,
          floatingLabelStyle: const TextStyle(fontSize: 19),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 12),
          icon: const Icon(Icons.description)),
    );
  }
}
