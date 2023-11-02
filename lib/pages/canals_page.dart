import 'package:flutter/material.dart';
import 'package:pushtotalk/components/canal_card.dart';
import 'package:pushtotalk/utils/colors.dart';

class CanalsPage extends StatefulWidget {
  const CanalsPage({super.key});

  @override
  State<CanalsPage> createState() => _CanalsPageState();
}

class _CanalsPageState extends State<CanalsPage> {
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
              title: const Text('Liste des canaux'),
              foregroundColor: Colors.white,
              centerTitle: true,
            ),
            body: Container(
              color: Colors.white,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return CanalCard(
                      title: 'Canal $index',
                      subtitle: 'Description du canal $index',
                    );
                  }),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Dialog "Ajout de canaux..."
                Dialog dialog = Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: SizedBox(
                    height: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // Faire un forms : Nom du canal + Description du canal
                        children: <Widget>[
                          const Text(
                            'Création du canal',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          canalFormField('Nom', 'Ex: titre super cool'),
                          const SizedBox(
                            height: 10,
                          ),
                          canalFormField(
                              'Description', 'Ex: description tip top'),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            label: const Text('Ajouter'),
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

  TextFormField canalFormField(title, hint) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: title,
          floatingLabelStyle: const TextStyle(fontSize: 19),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12),
          icon: const Icon(Icons.description)),
    );
  }
}
