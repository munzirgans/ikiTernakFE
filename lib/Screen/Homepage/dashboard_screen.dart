import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
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
            top: 340, // Ubah nilai top sesuai keinginan Anda
            left: 25, // Ubah nilai left sesuai keinginan Anda
            child: buildFood(context),
          ),
          Positioned(
            top: 340, // Ubah nilai top sesuai keinginan Anda
            left: 200, // Ubah nilai left sesuai keinginan Anda
            child: buildWater(context),
          ),
          Positioned(
            top: 470,
            left: 25,
            child: buildGrafik(context),
          ),
          Positioned(
            top: 0,
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
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 339,
                  height: 192,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 9,
                top: 12,
                child: Text(
                  'Egg Production',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 21,
                top: 152,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xFF424745),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 127,
                child: Text(
                  '25',
                  style: TextStyle(
                    color: Color(0xFF424745),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 102,
                child: Text(
                  '50',
                  style: TextStyle(
                    color: Color(0xFF424745),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 77,
                child: Text(
                  '75',
                  style: TextStyle(
                    color: Color(0xFF424745),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 16,
                top: 52,
                child: Text(
                  '100',
                  style: TextStyle(
                    color: Color(0xFF424745),
                    fontSize: 10,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 60,
                child: Container(
                  width: 275,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD8DCDA),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 85,
                child: Container(
                  width: 275,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD8DCDA),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 110,
                child: Container(
                  width: 275,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD8DCDA),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 135,
                child: Container(
                  width: 275,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD8DCDA),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40,
                top: 160,
                child: Container(
                  width: 275,
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Color(0xFFD8DCDA),
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 270,
                top: 14,
                child: Text(
                  'Last 7 days',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 57,
                top: 167,
                child: Text(
                  'Day 1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 112,
                top: 167,
                child: Text(
                  'Day 2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 168,
                top: 167,
                child: Text(
                  'Day 3',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 224,
                top: 167,
                child: Text(
                  'Day 4',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              const Positioned(
                left: 280,
                top: 167,
                child: Text(
                  'Day 5',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF575757),
                    fontSize: 8,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 65,
                top: 132,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF50BE92),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 121,
                top: 67,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF50BE92),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 174,
                top: 57,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF50BE92),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 233,
                top: 101,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF50BE92),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 289,
                top: 91,
                child: Container(
                  width: 5,
                  height: 5,
                  decoration: const ShapeDecoration(
                    color: Color(0xFF50BE92),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 68,
                top: 135,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.86),
                  child: Container(
                    width: 85.80,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF50BE92),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 124,
                top: 70,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.19),
                  child: Container(
                    width: 53.94,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF50BE92),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 177,
                top: 60,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(0.65),
                  child: Container(
                    width: 72.80,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF50BE92),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 236,
                top: 104,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(-0.18),
                  child: Container(
                    width: 55.90,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF50BE92),
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
                'assets/icon/profile_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                // Handle forum button tap
              },
            ),
            IconButton(
              icon: Image.asset(
                'assets/icon/forum_icon.png',
                width: 25,
                height: 35,
              ),
              onPressed: () {
                // Handle forum button tap
              },
            ),
          ],
        ),
      ),
    );
  }
}
