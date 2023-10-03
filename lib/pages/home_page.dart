import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(97, 67, 209, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Push To Talk'.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42),
            ),
            const SizedBox(
              height: 40,
            ),
            loginTextField('Identifiant'),
            loginTextField('Mot de passe'),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: const Text('Se connecter'),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox loginTextField(String hint) {
    return SizedBox(
        width: 250,
        child: TextField(
          cursorColor: Colors.white,
          cursorHeight: 20,
          cursorWidth: 1,
          keyboardType: TextInputType.visiblePassword,
          style: const TextStyle(
              color: Colors.white, decoration: TextDecoration.none),
          decoration: InputDecoration(
              hintText: (hint),
              hintStyle: const TextStyle(color: Colors.white),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                      width: 2, color: Color.fromARGB(255, 142, 138, 138))),
              enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white))),
        ));
  }
}
