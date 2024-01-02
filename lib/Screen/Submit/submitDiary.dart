import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const submitDiary());
}

class submitDiary extends StatelessWidget {
  const submitDiary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          SubmitDiary(),
        ]),
      ),
    );
  }
}

class SubmitDiary extends StatefulWidget {
  @override
  _SubmitDiaryState createState() => _SubmitDiaryState();
}

class _SubmitDiaryState extends State<SubmitDiary> {
  DateTime? selectedDate;

  void onSubmitPressed() {
    // Implement your logic when the Submit button is pressed
    print('Submit Pressed');
  }

  void onCancelPressed() {
    // Implement your logic when the Cancel button is pressed
    print('Cancel Pressed');
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
                            controller: TextEditingController(
                              text: selectedDate != null
                                  ? DateFormat('dd-MM-yyyy')
                                      .format(selectedDate!)
                                  : '',
                            ),
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
                      child: const TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
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
