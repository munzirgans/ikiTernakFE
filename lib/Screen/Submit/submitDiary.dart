import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Layout/alert_dialog.dart';
import 'package:ikiternak_apps/Screen/TernakDiary/diaryTernak.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'package:ikiternak_apps/main.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SubmitDiary());
}

class SubmitDiary extends StatelessWidget {
  const SubmitDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SubmitDiaryForm(),
        ]),
      ),
    );
  }
}

class SubmitDiaryForm extends StatefulWidget {
  @override
  _SubmitDiaryFormState createState() => _SubmitDiaryFormState();
}

class _SubmitDiaryFormState extends State<SubmitDiaryForm> {
  DateTime? selectedDate;
  TextEditingController harvestDateController = TextEditingController();
  TextEditingController quantityController = TextEditingController();

  void onSubmitPressed() {
    String? token = prefs.getString('jwtToken');
    const String path = '/diaryternak/diary';
    String? apiURL = Env.apiURL! + path;
    final Map<String, dynamic> data = {
      'harvest_date': harvestDateController.text,
      'quantity': quantityController.text,
    };
    try {
      http
          .post(Uri.parse(apiURL),
              headers: {
                'Content-type': 'application/json',
                'Authorization': 'Bearer $token'
              },
              body: jsonEncode(data))
          .then((response) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DiaryTernak()));
        } else {
          AlertDialogWidget.showAlertDialog(
              context, "Error", jsonResponse['message']);
        }
      });
    } catch (error) {
      AlertDialogWidget.showAlertDialog(context, "Error", error.toString());
    }
  }

  void onCancelPressed() {
    // Navigate to DiaryTernak when Cancel button is pressed
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DiaryTernak()),
    );
  }

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
                left: 22,
                top: 52,
                child: GestureDetector(
                  onTap: onCancelPressed,
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
                left: 22,
                top: 164,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Harvest Date',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 230,
                      margin: const EdgeInsets.only(left: 55),
                      child: GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextField(
                            style: const TextStyle(color: Colors.black),
                            controller: harvestDateController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Date',
                              hintStyle: TextStyle(color: Colors.grey),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              suffixIcon: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 22,
                top: 210,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Quantity',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 230,
                      margin: const EdgeInsets.only(left: 80),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        controller: quantityController,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 38,
                top: 760,
                child: Column(
                  children: [
                    SubmitButton(onPressed: onSubmitPressed),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const Positioned(
                left: 152,
                top: 101,
                child: Text(
                  'Add Data',
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
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        harvestDateController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }
}

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;

  SubmitButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 323,
        height: 39,
        decoration: ShapeDecoration(
          color: const Color(0xFF50BE92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: const Center(
          child: Text(
            'Submit',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
