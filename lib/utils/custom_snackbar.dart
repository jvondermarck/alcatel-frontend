import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(BuildContext context, String message,
      Color backgroundColor, Color textColor) {
    final snackbar = SnackBar(
      content: Center(
        child: Text(
          message,
          style: TextStyle(color: textColor, fontSize: 15),
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 80),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
