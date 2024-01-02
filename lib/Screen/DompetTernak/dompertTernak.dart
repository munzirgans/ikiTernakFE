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
  final String reportDate;
  final String harvestDate;
  final int eggsTotal;

  ReportData({
    required this.reportDate,
    required this.harvestDate,
    required this.eggsTotal,
  });
}

class DompetTernak extends StatefulWidget {
  @override
  _DompetTernakState createState() => _DompetTernakState();
}

class _DompetTernakState extends State<DompetTernak> {
  bool isDiaryTernakActive = false;
  bool isDompetTernakActive = true;

  List<ReportData> reportDataList = [
    ReportData(
      reportDate: 'Monday, 22 December 2022',
      harvestDate: 'Saturday, 19 December 2022',
      eggsTotal: 25,
    ),
    ReportData(
      reportDate: 'Tuesday, 23 December 2022',
      harvestDate: 'Sunday, 20 December 2022',
      eggsTotal: 30,
    ),
    ReportData(
      reportDate: 'Wednesday, 24 December 2022',
      harvestDate: 'Monday, 21 December 2022',
      eggsTotal: 35,
    ),
  ];

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
                    // buildGrafik(context),
                    const SizedBox(height: 200),
                    Expanded(
                      child: ListView.builder(
                        itemCount: reportDataList.length + 5,
                        itemBuilder: (context, index) {
                          if (index < reportDataList.length) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: buildReportCard(reportDataList[index]),
                            );
                          } else {
                            ReportData placeholderData = ReportData(
                              reportDate: 'Placeholder Date',
                              harvestDate: 'Placeholder Harvest Date',
                              eggsTotal: 0,
                            );
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: buildReportCard(placeholderData),
                            );
                          }
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

  // Hapus kode grafik

  Widget buildReportCard(ReportData reportData) {
    return Container(
      width: 339,
      height: 99,
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
          Container(
            width: 24,
            height: 24,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Positioned(
                  top: 2,
                  left: 2,
                  child: Image.asset(
                    'assets/icon/seru.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 35,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Report Date',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: -5,
                          ),
                        ),
                        Text(
                          reportData.reportDate,
                          style: const TextStyle(
                            color: Color(0xFF9F9F9F),
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: -2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      right: 30,
                      left: 0,
                    ),
                    child: Text(
                      'Eggs Total',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 2,
                      left: 0,
                      top: 20,
                    ),
                    child: Text(
                      reportData.eggsTotal.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF50BE92),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: -1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 4,
                      left: 35,
                    ),
                    child: Text(
                      'Harvest Date',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: -3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 2,
                      left: 35,
                    ),
                    child: Text(
                      reportData.harvestDate,
                      style: const TextStyle(
                        color: Color(0xFF9F9F9F),
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: -1,
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
    onPressed: onPressed, // This should call onPressed
  );
}

void submitDompett(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => submitDompet()),
  );
}
