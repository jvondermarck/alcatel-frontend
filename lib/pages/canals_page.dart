import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/canal_card.dart';
import 'package:pushtotalk/components/canal_form_field.dart';

class CanalsPage extends StatefulWidget {
  const CanalsPage({Key? key}) : super(key: key);

  @override
  State<CanalsPage> createState() => _CanalsPageState();
}

class _CanalsPageState extends State<CanalsPage> {
  List<CanalCard> canalList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

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
            itemCount: canalList.length,
            itemBuilder: (context, index) {
              return canalList[index];
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SizedBox(
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          'Création du canal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        CanalFormField(
                          title: 'Nom',
                          hint: 'Ex: titre super cool',
                          controller: titleController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CanalFormField(
                          title: 'Description',
                          hint: 'Ex: description tip top',
                          controller: subtitleController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              String title = titleController.text;
                              String subtitle = subtitleController.text;
                              canalList.add(CanalCard(
                                title: title,
                                subtitle: subtitle,
                              ));
                            });
                            titleController.clear();
                            subtitleController.clear();
                            Navigator.pop(context);
                          },
                          label: const Text('Valider'),
                          icon: const Icon(Icons.check),
                        )
                      ],
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
