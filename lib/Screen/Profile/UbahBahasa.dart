import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';

void main() {
  runApp(const UbahBahasa());
}

class UbahBahasa extends StatelessWidget {
  const UbahBahasa({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Bahasa(),
          ],
        ),
      ),
    );
  }
}

class Bahasa extends StatefulWidget {
  @override
  _BahasaState createState() => _BahasaState();
}

class _BahasaState extends State<Bahasa> {
  String selectedLanguage = ''; // To track the selected language

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 844,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
          child: Stack(
            children: [
              const Positioned(
                left: 28,
                top: 90,
                child: Text(
                  'Choose Your Language',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 26,
                top: 140,
                child: buildLanguageContainer(
                    'English (UK)',
                    'assets/icon/uk.png',
                    'Language successfully changed to English (UK)'),
              ),
              Positioned(
                left: 26,
                top: 209,
                child: buildLanguageContainer(
                    'English (US)',
                    'assets/icon/us.png',
                    'Language successfully changed to English (US)'),
              ),
              Positioned(
                left: 26,
                top: 278,
                child: buildLanguageContainer(
                    'Tagalog',
                    'assets/icon/tagalog.png',
                    'Wika ay matagumpay na binago sa Tagalog'),
              ),
              Positioned(
                left: 26,
                top: 347,
                child: buildLanguageContainer(
                    'Bahasa Indonesia',
                    'assets/icon/indonesia.png',
                    'Bahasa berhasil diubah menjadi Bahasa Indonesia'),
              ),
              Positioned(
                left: 26,
                top: 416,
                child: buildLanguageContainer(
                    'Portuguese',
                    'assets/icon/portugal.png',
                    'Idioma alterado com sucesso para o Português'),
              ),
              Positioned(
                left: 26,
                top: 485,
                child: buildLanguageContainer(
                    'Español',
                    'assets/icon/spain.png',
                    'Idioma cambiado exitosamente a Español'),
              ),
              Positioned(
                left: 26,
                top: 554,
                child: buildLanguageContainer(
                    'Français',
                    'assets/icon/france.png',
                    'Langue changée avec succès en français'),
              ),
              Positioned(
                left: 20,
                top: 51,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userprofile()),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildLanguageContainer(
      String language, String flagImagePath, String successMessage) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language; // Update selected language
          showLanguageChangeNotification(
              context, successMessage); // Show notification
        });
      },
      child: Container(
        width: 339,
        height: 59,
        decoration: BoxDecoration(
          color: selectedLanguage == language
              ? const Color(0xFF8FF6CD)
              : Colors.white,
          border: Border.all(width: 1, color: const Color(0xFFEBEBEB)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 12.0),
              child: Image.asset(
                flagImagePath,
                width: 25,
                height: 25,
              ),
            ), // Flag image
            Text(
              language,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageChangeNotification(
      BuildContext context, String successMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage),
      ),
    );
  }
}
