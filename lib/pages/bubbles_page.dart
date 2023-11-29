import 'package:flutter/material.dart';
import 'package:pushtotalk/class/rainbow_user.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/bubble_card.dart';
import 'package:pushtotalk/components/bubble_form_field.dart';
import 'package:pushtotalk/pages/profile_page.dart';

class BubblesPage extends StatefulWidget {
  final RainbowUser user;
  const BubblesPage({Key? key, required this.user}) : super(key: key);

  @override
  State<BubblesPage> createState() => _BubblesPageState();
}

class _BubblesPageState extends State<BubblesPage> {
  List<BubbleCard> bubbleList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(user: widget.user),
              ),
            );
          },
          icon: const Icon(Icons.person),
        ),
      ],
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
              final formKey = GlobalKey<FormState>();
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Création de la bulle',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          BubbleFormField(
                            title: 'Nom',
                            icon: Icons.title,
                            hint: 'Ex: titre super cool',
                            controller: titleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BubbleFormField(
                            title: 'Description',
                            icon: Icons.description,
                            hint: 'Ex: description tip top',
                            controller: subtitleController,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                if (formKey.currentState!.validate()) {
                                  String title = titleController.text;
                                  String subtitle = subtitleController.text;
                                  bubbleList.add(BubbleCard(
                                    title: title,
                                    subtitle: subtitle,
                                  ));
                                  Navigator.pop(context);
                                }
                              });
                              titleController.clear();
                              subtitleController.clear();
                            },
                            label: const Text('Valider'),
                            icon: const Icon(Icons.check),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
