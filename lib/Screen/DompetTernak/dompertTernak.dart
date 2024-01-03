import 'package:flutter/material.dart';

import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:ikiternak_apps/Screen/Submit/submitDompet.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:ikiternak_apps/Screen/forum/forumTernak.dart';
import 'button.dart';
import 'constant.dart';

void main() {
  runApp(DompetTernak());
}

class ReportData {
  ReportData();
}

class DompetTernak extends StatefulWidget {
  @override
  _DompetTernakState createState() => _DompetTernakState();
}

class _DompetTernakState extends State<DompetTernak> {
  bool isDiaryTernakActive = false;
  bool isDompetTernakActive = true;

  DateTime fromDate = DateTime.now(); // Tanggal awal
  DateTime toDate = DateTime.now(); // Tanggal akhir

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: const Color(0xFFF8F8F8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50.0,
                  vertical: 12.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildDiaryTernakButton(
                            'Diary Ternak', isDiaryTernakActive),
                        buildDiaryTernakButton(
                            'Dompet Ternak', isDompetTernakActive),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 200),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            3 + 5, // Changed to a fixed number for simplicity
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: buildReportCard(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 16,
              child: buildIconButton('assets/icon/add.png', () {
                submitDompett(
                    context); // Call the submitDompett function with context
              }),
            ),
            Positioned(
              top: 160,
              left: 0,
              right: 250,
              child: buildThisMonth(context),
            ),
            transaction(context),
            Positioned(
              top: 180,
              left: 0,
              right: 160,
              child: buildIncome(context),
            ),
            Positioned(
              top: 180,
              left: 160,
              right: 0,
              child: buildExpense(context),
            ),
            Positioned(
              top: 260,
              left: 0,
              right: 250,
              child: buildRecently(context),
            )
          ],
        ),
        bottomNavigationBar: NavigationButtomBar(),
      ),
    );
  }

  Widget buildDiaryTernakButton(String buttonText, bool isActive) {
    return Container(
      width: 120,
      child: DompetTernakButton(
        isActive: isActive,
        buttonText: buttonText,
        onPressed: () {
          setState(() {
            isDiaryTernakActive = buttonText == 'Diary Ternak';
            isDompetTernakActive = buttonText == 'Dompet Ternak';
            if (isDiaryTernakActive) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiaryTernak()),
              );
            }
          });
        },
      ),
    );
  }

  Widget transaction(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 45, right: 16, top: 80),
          child: Text(
            'Transaction History',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildThisMonth(BuildContext context) {
  return const Column(
    children: [
      Text(
        'This Month',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    ],
  );
}

Widget buildIncome(BuildContext context) {
  return Column(
    children: [
      Container(
        width: 140,
        height: 65,
        decoration: ShapeDecoration(
          color: const Color(0xFF73D5AE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            const BoxShadow(
              color: Color(0x19000000),
              blurRadius: 5,
              offset: Offset(3, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Income',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: -1,
              ),
            ),
            Text(
              'Rp. 1.078.350,-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildExpense(BuildContext context) {
  return Column(
    children: [
      Container(
        width: 140,
        height: 65,
        decoration: ShapeDecoration(
          color: const Color(0xFFED4C5C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            const BoxShadow(
              color: Color(0x19000000),
              blurRadius: 5,
              offset: Offset(3, 3),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Expense',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: -1,
              ),
            ),
            Text(
              'Rp. 8.090.000,-',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 2,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildRecently(BuildContext context) {
  return const Column(
    children: [
      Text(
        'Recently',
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    ],
  );
}

Widget buildReportCard() {
  return Container(
    width: 339,
    height: 100,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pembelian Telur',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: 3,
                    ),
                  ),
                  Text(
                    getFormattedDate('22 December 2022'), // Example date
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: -1,
                    ),
                  ),
                  const Text(
                    'Pembelian telur ayam sebanyak...',
                    style: TextStyle(
                      color: Color(0xFF9F9F9F),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: 30,
                    left: 0,
                  ),
                  child: Text(
                    'Rp. 1.000.000,-',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xFFED4C5C),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      height: -12,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

String getFormattedDate(String fullDate) {
  List<String> dateParts = fullDate.split(',');
  if (dateParts.length > 1) {
    return dateParts[1].trim();
  }
  return fullDate;
}

class NavigationButtomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => DompetTernak()),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Userprofile()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildIconButton(String assetPath, VoidCallback onPressed) {
  return IconButton(
    icon: Image.asset(
      assetPath,
      width: 70,
      height: 65,
    ),
    onPressed: onPressed,
  );
}

void submitDompett(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => submitDompet()),
  );
}
