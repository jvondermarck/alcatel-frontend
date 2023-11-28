import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/bubble_card.dart';
import 'package:pushtotalk/components/bubble_form_field.dart';
import 'package:pushtotalk/interfaces/locator.dart';
import 'package:pushtotalk/services/locator_impl.dart';
import 'package:geolocator/geolocator.dart';

class BubblesPage extends StatefulWidget {
  const BubblesPage({Key? key}) : super(key: key);

  @override
  State<BubblesPage> createState() => _BubblesPageState();
}

class _BubblesPageState extends State<BubblesPage> {
  List<BubbleCard> bubbleList = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();
  Locator locator = LocatorImp();

  String longitude = '';
  String latitude = '';

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
              final formKey = GlobalKey<FormState>();

              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return SingleChildScrollView(
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.location_on),
                                    ],
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Long: $longitude',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Lat: $latitude',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  ElevatedButton.icon(
                                    onPressed: () async {
                                      Position position =
                                          await locator.getCurrentLocation();
                                      setState(() {
                                        longitude =
                                            position.longitude.toString();
                                        latitude = position.latitude.toString();
                                      });
                                    },
                                    label: const Text('Actualiser'),
                                    icon: const Icon(Icons.location_on),
                                  ),
                                ],
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
                                      BubbleCard newBubble = BubbleCard(
                                        title: title,
                                        subtitle: subtitle,
                                      );
                                      bubbleList.add(newBubble);
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
                    );
                  },
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
