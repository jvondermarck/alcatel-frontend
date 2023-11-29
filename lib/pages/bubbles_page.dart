import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/bubble_card.dart';
import 'package:pushtotalk/components/bubble_creation_form.dart';

class BubblesPage extends StatefulWidget {
  const BubblesPage({Key? key}) : super(key: key);

  @override
  State<BubblesPage> createState() => _BubblesPageState();
}

class _BubblesPageState extends State<BubblesPage> {
  List<BubbleCard> bubbleList = [];

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'Liste des canaux',
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: bubbleList.length,
            itemBuilder: (context, index) {
              return bubbleList[index];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BubbleCreationForm(
                    onBubbleCreated: (BubbleCard newBubble) {
                  setState(() {
                    bubbleList.add(newBubble);
                  });
                });
              });
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
