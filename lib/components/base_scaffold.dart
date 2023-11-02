import 'package:flutter/material.dart';
import 'package:pushtotalk/utils/colors.dart';

class BaseScaffold extends StatefulWidget {
  final String? title;
  final Widget body;
  final FloatingActionButton? floatingActionButton;

  const BaseScaffold(
      {super.key, this.title, required this.body, this.floatingActionButton});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
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
              title: Text(widget.title ?? ''),
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
            body: widget.body,
            floatingActionButton: widget.floatingActionButton));
  }
}
