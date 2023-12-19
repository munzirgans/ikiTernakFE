import 'package:flutter/material.dart';

void main() {
  runApp(DiaryTernak());
}

class DiaryTernak extends StatefulWidget {
  @override
  _DiaryTernakState createState() => _DiaryTernakState();
}

class _DiaryTernakState extends State<DiaryTernak> {
  bool isDiaryTernakActive = true;
  bool isDompetTernakActive = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ternak Diary',
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
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.primaryDelta! > 0) {
                    // Geser ke kanan
                    setState(() {
                      isDiaryTernakActive = false;
                      isDompetTernakActive = true;
                    });
                  } else if (details.primaryDelta! < 0) {
                    // Geser ke kiri
                    setState(() {
                      isDiaryTernakActive = true;
                      isDompetTernakActive = false;
                    });
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDiaryTernakActive = true;
                      isDompetTernakActive = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDiaryTernakActive ? Colors.green : Colors.white,
                    foregroundColor:
                        isDiaryTernakActive ? Colors.white : Colors.green,
                  ),
                  child: const Text('Diary Ternak'),
                ),
              ),
              GestureDetector(
                onHorizontalDragUpdate: (details) {
                  if (details.primaryDelta! > 0) {
                    // Geser ke kanan
                    setState(() {
                      isDiaryTernakActive = false;
                      isDompetTernakActive = true;
                    });
                  } else if (details.primaryDelta! < 0) {
                    // Geser ke kiri
                    setState(() {
                      isDiaryTernakActive = true;
                      isDompetTernakActive = false;
                    });
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDiaryTernakActive = false;
                      isDompetTernakActive = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isDompetTernakActive ? Colors.green : Colors.white,
                    foregroundColor:
                        isDompetTernakActive ? Colors.white : Colors.green,
                  ),
                  child: const Text('Dompet Ternak'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
