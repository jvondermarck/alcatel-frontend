import 'package:flutter/material.dart';
import 'package:pushtotalk/components/canal_card.dart';
import 'package:pushtotalk/components/canal_form_field.dart';
import 'package:pushtotalk/utils/colors.dart';

class CanalsPage extends StatefulWidget {
  const CanalsPage({super.key});

  @override
  State<CanalsPage> createState() => _CanalsPageState();
}

class _CanalsPageState extends State<CanalsPage> {
  List<CanalCard> canalList = [
    const CanalCard(title: 'Canal 1', subtitle: 'Description 1'),
    const CanalCard(title: 'Canal 2', subtitle: 'Description 2'),
    const CanalCard(title: 'Canal 3', subtitle: 'Description 3'),
    const CanalCard(title: 'Canal 4', subtitle: 'Description 4'),
    const CanalCard(title: 'Canal 5', subtitle: 'Description 5'),
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

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
              title: const Text('Liste des canaux'),
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Container(
              color: Colors.white,
              child: RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 2));
                },
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
                Dialog dialog = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            'Création du canal',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          CanalFormField(
                              title: 'Nom',
                              hint: 'Ex: titre super cool',
                              controller: titleController),
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
                                    title: title, subtitle: subtitle));
                              });
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) => dialog);
              },
              child: const Icon(Icons.add, size: 32),
            )));
  }
}
