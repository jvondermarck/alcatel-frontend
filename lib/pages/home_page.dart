// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pushtotalk/class/rainbow_user.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/custom_text_field.dart';
import 'package:pushtotalk/pages/bubbles_page.dart';
import 'package:pushtotalk/repository/platform_repository.dart';
import 'package:pushtotalk/utils/custom_snackbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final PlatformRepository platformRepository = PlatformRepository();
  String title = "Push To Talk";
  bool isRainbowSdkInitialized = false;
  bool isConnected = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
                label: 'Email', hidden: false, controller: emailController),
            CustomTextField(
                label: 'Mot de passe',
                hidden: true,
                controller: passwordController),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () async {
                bool result = await platformRepository.login(
                    emailController.text, passwordController.text);
                setState(() {
                  isConnected = result;
                });
                if (isConnected) {
                  RainbowUser user = await platformRepository.getRainbowUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BubblesPage(
                        user: user,
                      ),
                    ),
                  );
                } else {
                  CustomSnackbar.showSnackbar(context, "La connexion a échoué",
                      Colors.red, Colors.white);
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 50),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text('Se connecter', style: TextStyle(fontSize: 15)),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
