import 'package:flutter/material.dart';

class CanalFormField extends StatefulWidget {
  const CanalFormField(
      {super.key,
      required this.title,
      required this.hint,
      required this.icon,
      required this.controller});

  final String title;
  final String hint;
  final IconData icon;
  final TextEditingController controller;

  @override
  State<CanalFormField> createState() => _CanalFormFieldState();
}

class _CanalFormFieldState extends State<CanalFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.title,
          floatingLabelStyle: const TextStyle(fontSize: 19),
          hintText: widget.hint,
          hintStyle: const TextStyle(fontSize: 12),
          icon: Icon(widget.icon)),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez remplir ce champ';
        }
        return null;
      },
    );
  }
}
