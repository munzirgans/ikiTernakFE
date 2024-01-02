import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';

void main() {
  runApp(const FaqPage());
}

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            Faq(),
          ],
        ),
      ),
    );
  }
}

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  int selectedQuestion = -1;

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
                left: 26,
                top: 90,
                child: Text(
                  'F.A.Q.',
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
                left: 18,
                top: 51,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userprofile()),
                    ); // Menutup layar FAQ
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
              Positioned(
                left: 26,
                top: 140,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedQuestion = selectedQuestion == 0 ? -1 : 0;
                    });
                  },
                  child: Container(
                    width: 339,
                    height: selectedQuestion == 0 ? 150 : 59,
                    margin:
                        EdgeInsets.only(bottom: selectedQuestion == 0 ? 20 : 0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFEBEBEB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'How to use IkiTernak?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Icon(selectedQuestion == 0
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                            if (selectedQuestion == 0)
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 16.0),
                                child: Text(
                                  '1. Register an account to access all features of IkiTernak\n'
                                  '2. Access the myTernak menu to be able to monitor your farm\n'
                                  '3. Access the Diary menu to administer your farm\n'
                                  '4. Access the forum menu to find out and tell stories about your farm',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (selectedQuestion == 0)
                Positioned(
                  left: 26,
                  top: 209 + (selectedQuestion == 0 ? 79 + 20 : 0),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                ),
              Positioned(
                left: 26,
                top: 209 + (selectedQuestion == 0 ? 79 + 20 : 0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedQuestion = selectedQuestion == 1 ? -1 : 1;
                    });
                  },
                  child: Container(
                    width: 339,
                    height: selectedQuestion == 1 ? 150 : 59,
                    margin:
                        EdgeInsets.only(bottom: selectedQuestion == 1 ? 20 : 0),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFEBEBEB)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Scrollbar(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'How do I change my password?',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Icon(selectedQuestion == 1
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                            if (selectedQuestion == 1)
                              const Padding(
                                padding: EdgeInsets.only(top: 8.0, left: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'To change your password, follow these steps:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '1. Access the password change menu on the profile',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    Text(
                                      '2. Enter the current password',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    Text(
                                      '3. Enter the new password that will be used',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    Text(
                                      '4. Re-enter the new password that was filled in previously',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                    Text(
                                      '5. Click the submit button to save changes',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
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
}
