import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:ikiternak_apps/Screen/forum/forumTernak.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'buttomNavigationBar.dart';

void main() {
  runApp(const DashboardScreen());
}

class DashboardScreen extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const DashboardScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class Dashboard extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String temperature = '26°C';
  String moistureValue = '50%';
  String ammoniaLevel = 'LIGHT';

  @override
  void initState() {
    super.initState();

    // Simulate IoT data
    simulateIoTData();
  }

  void simulateIoTData() {
    Future.delayed(Duration.zero, () {
      setState(() {
        temperature = '26°C'; // Replace with actual IoT data
        moistureValue = '50%'; // Replace with actual IoT data
        ammoniaLevel = 'LIGHT'; // Replace with actual IoT data
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 67,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    'Dashboard',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 6,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 255,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    buildTemperatureCard(),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 70,
            left: 175,
            child: buildMoistureCard(),
          ),
          Positioned(
            top: 98,
            left: 203,
            child: buildAmmoniaCard(),
          ),
          Positioned(
            top: 340, // Adjust the top value according to your needs
            left: 25, // Adjust the left value according to your needs
            child: buildFood(context),
          ),
          Positioned(
            top: 340, // Adjust the top value according to your needs
            left: 200, // Adjust the left value according to your needs
            child: buildWater(context),
          ),
          Positioned(
            top: 470,
            left: 25,
            child: buildGrafik(context),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: NavigationButtomBar(context),
          )
        ],
      ),
    );
  }

  Widget buildTemperatureCard() {
    return Container(
      width: 165,
      height: 255,
      margin: const EdgeInsets.only(right: 0, left: 25, top: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFEBEBEB), // Warna garis pinggir
          width: 1, // Lebar garis pinggir
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Air Temperature',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Normal temperature as usual',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: -2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 80),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    temperature,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF171717),
                      fontSize: 28,
                      fontFamily: 'Pragati Narrow',
                      fontWeight: FontWeight.w400,
                      height: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 85, top: 95),
              child: SizedBox(
                width: 75,
                height: 120,
                child: Image.asset(
                  'assets/icon/thermometer_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMoistureCard() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 165,
        height: 120,
        margin: const EdgeInsets.only(left: 30, right: 0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xFFEBEBEB), // Warna garis pinggir
            width: 1, // Lebar garis pinggir
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Moisture',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Normal temperature as usual',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF575757),
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: -2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    moistureValue,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF171717),
                      fontSize: 28,
                      fontFamily: 'Pragati Narrow',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 100, top: 40),
                child: SizedBox(
                  width: 42,
                  height: 66,
                  child: Image.asset(
                    'assets/icon/water_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAmmoniaCard() {
    return Container(
      width: 165,
      height: 120,
      margin: const EdgeInsets.only(
        top: 105,
        left: 1, // Sesuaikan nilai left sesuai keinginan Anda
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFFEBEBEB), // Warna garis pinggir
          width: 1, // Lebar garis pinggir
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Ammonia Levels',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Normal temperature as usual',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: -2,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  ammoniaLevel,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 32,
                    fontFamily: 'Pragati Narrow',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 100, top: 40),
              child: SizedBox(
                width: 54,
                height: 62,
                child: Image.asset(
                  'assets/icon/amonia_icon.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFood(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 165,
          height: 120,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Food Dispencer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Condition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: -1,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 70),
                  child: SizedBox(
                    width: 62,
                    height: 33,
                    child: Image.asset(
                      'assets/icon/battery_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, top: 55),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/icon/food_icon.png',
                      fit: BoxFit.cover,
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

  Widget buildWater(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 165,
          height: 120,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Stack(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Water Dispencer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Condition',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: -1,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, top: 70),
                  child: SizedBox(
                    width: 62,
                    height: 33,
                    child: Image.asset(
                      'assets/icon/battery2_icon.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, top: 55),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Image.asset(
                      'assets/icon/FillDrip_icon.png',
                      fit: BoxFit.cover,
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

  Widget buildGrafik(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 339,
          height: 192,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(
                show: true,
                border: const Border(
                  bottom: BorderSide(
                    color: Color(0xFFD8DCDA),
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Color(0xFFD8DCDA),
                    width: 1,
                  ),
                  right: BorderSide(
                    color: Color(0xFFD8DCDA),
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Color(0xFFD8DCDA),
                    width: 1,
                  ),
                ),
              ),
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: 100,
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(1, 20),
                    const FlSpot(2, 40),
                    const FlSpot(3, 60),
                    const FlSpot(4, 80),
                    const FlSpot(5, 40),
                    const FlSpot(6, 60),
                  ],
                  isCurved: true,
                  color: const Color(0xFF50BE92),
                  barWidth: 2,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  // ignore: non_constant_identifier_names
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
                // Handle home button tap
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
