import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Profile/UbahBahasa.dart';
import 'package:ikiternak_apps/Screen/Profile/changePassword.dart';
import 'package:ikiternak_apps/Screen/Profile/editProfile.dart';
import 'package:ikiternak_apps/Screen/Profile/faq.dart';
import 'package:ikiternak_apps/Screen/Profile/notification.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:ikiternak_apps/Screen/forum/forumTernak.dart';

void main() {
  runApp(const Userprofile());
}

class Userprofile extends StatelessWidget {
  const Userprofile({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Logout(),
        ),
        bottomNavigationBar: NavigationButtomBar(),
      ),
    );
  }
}

class Logout extends StatelessWidget {
  final String notificationsIcon = 'assets/icon/notif.png';
  final String languageIcon = 'assets/icon/bahasa.png';
  final String passwordIcon = 'assets/icon/pw.png';
  final String faqIcon = 'assets/icon/question.png';
  final String logoutIcon = 'assets/icon/signout.png';

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
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 390,
                  height: 171,
                  decoration: const BoxDecoration(color: Color(0xFF50BE92)),
                ),
              ),
              const Positioned(
                left: 28,
                top: 66,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 27,
                top: 102,
                child: Container(
                  width: 335,
                  height: 138,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: ShapeDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/icon/muns.png'),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(
                                    width: 1, color: Color(0xFFDCE3E0)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 70,
                          top: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Joko Sudirmant',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              Text(
                                'okojokoj66@gmail.com',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 65,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfilePage()),
                              );
                            },
                            child: Container(
                              width: 290,
                              height: 27,
                              decoration: ShapeDecoration(
                                color: const Color(0xFF50BE92),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 120,
                          top: 72,
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 262,
                child: SizedBox(
                  width: 335,
                  height: 257,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 335,
                          height: 257,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x19000000),
                                blurRadius: 15,
                                offset: Offset(3, 3),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 12,
                        top: 18,
                        child: GestureDetector(
                          onTap: () {
                            // Fungsi yang akan dipanggil saat ikon notifikasi ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Notif()),
                            );
                          },
                          child: SizedBox(
                            width: 107,
                            height: 20,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(notificationsIcon),
                                const SizedBox(width: 8),
                                const Text(
                                  'Notifications',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 11,
                        top: 69,
                        child: GestureDetector(
                          onTap: () {
                            // Fungsi yang akan dipanggil saat ikon bahasa ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UbahBahasa()),
                            );
                          },
                          child: SizedBox(
                            width: 94,
                            height: 20,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(languageIcon),
                                const SizedBox(width: 8),
                                const Text(
                                  'Language',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 22,
                        top: 122,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UbahPassword()),
                            );
                          },
                          child: Row(
                            children: [
                              Image.asset(passwordIcon),
                              const SizedBox(width: 8),
                              const Text(
                                'Change Password',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 17,
                        top: 171,
                        child: GestureDetector(
                          onTap: () {
                            // Fungsi yang akan dipanggil saat teks "F.A.Q." ditekan
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FaqPage()),
                            );
                          },
                          child: SizedBox(
                            width: 65,
                            height: 20,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(faqIcon),
                                const SizedBox(width: 8),
                                const Text(
                                  'F.A.Q.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 54,
                        child: Container(
                          width: 260,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 105,
                        child: Container(
                          width: 260,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 156,
                        child: Container(
                          width: 260,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 38,
                        top: 207,
                        child: Container(
                          width: 260,
                          decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                color: Color(0xFFE6E6E6),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 221,
                        child: GestureDetector(
                          onTap: () {
                            // Fungsi yang akan dipanggil saat teks "Log Out" ditekan
                            print('Log Out Tapped');
                          },
                          child: SizedBox(
                            width: 79,
                            height: 18,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(logoutIcon),
                                const SizedBox(width: 8),
                                const Text(
                                  'Log Out',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 13,
                        top: 120,
                        child: SizedBox(
                          width: 16,
                          height: 20,
                          child: const Stack(children: []),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget NavigationButtomBar(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset(
                'assets/icon/home_icon.png',
                width: 40,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/diary_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DiaryTernak()),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/forum_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ForumTernak()),
                );
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/profile_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                // Handle tombol forum
              },
            ),
          ],
        ),
      ),
    );
  }
}
