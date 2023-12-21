// main.dart
import 'package:flutter/material.dart';
import 'button.dart';
import 'constant.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 76.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DiaryTernakButton(
                isActive: isDiaryTernakActive,
                buttonText: 'Diary Ternak',
                onPressed: () {
                  setState(() {
                    isDiaryTernakActive = true;
                    isDompetTernakActive = false;
                  });
                },
              ),
              DiaryTernakButton(
                isActive: isDompetTernakActive,
                buttonText: 'Dompet Ternak',
                onPressed: () {
                  setState(() {
                    isDiaryTernakActive = false;
                    isDompetTernakActive = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
