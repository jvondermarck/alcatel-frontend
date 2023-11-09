import 'package:flutter/material.dart';
import 'package:pushtotalk/components/base_scaffold.dart';
import 'package:pushtotalk/components/custom_text_field.dart';
import 'package:pushtotalk/pages/bubbles_page.dart';
import 'package:pushtotalk/repository/platform_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final PlatformRepository platformRepository = PlatformRepository();
  String title = "Push To Talk";
  bool isRainbowSdkInitialized = false;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              isRainbowSdkInitialized ? "slt c init" : "pas init ff",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 42,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomTextField(label: 'Email', hidden: false),
            const CustomTextField(label: 'Mot de passe', hidden: true),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              // TODO - call repository function to login
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BubblesPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Se connecter'),
            ),
            ElevatedButton(
              onPressed: () async {
                bool result =
                    await platformRepository.isRainbowSdkInitialized();
                setState(() {
                  isRainbowSdkInitialized = result;
                });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const BubblesPage(),
                //   ),
                // );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('c init ouuuuuuuuuuuuuuuuuuuu'),
            ),
          ],
        ),
      ),
    );
  }
}
