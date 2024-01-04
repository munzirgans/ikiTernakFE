import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ikiternak_apps/Screen/DompetTernak/dompertTernak.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'package:ikiternak_apps/main.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(submitDompet());
}

class submitDompet extends StatefulWidget {
  submitDompet({Key? key}) : super(key: key);

  @override
  _submitDompetState createState() => _submitDompetState();
}

class _submitDompetState extends State<submitDompet> {
  DateTime? selectedDate;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();

  void dompetSubmit() {
    String? token = prefs.getString('jwtToken');
    const String path = '/diaryternak/diary';
    String? apiURL = Env.apiURL! + path;
    final Map<String, dynamic> data = {
      'title': _titleController.text,
      'date': selectedDate,
      'amount': _amountController.text,
      'category': _categoryController.text,
      'description': _descriptionController.text,
    };
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(
          children: [
            SubmitDompet(
              selectedDate: selectedDate,
              onDateChanged: _onDateChanged,
              amountController: _amountController,
              categoryController: _categoryController,
              descriptionController: _descriptionController,
              titleController: _titleController,
              onCancelPressed: () {
                // Navigate to DompetTernak screen when Cancel button is pressed
                print("test");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DompetTernak()),
                );
              },
              onSubmitPressed: () {
                // print("test");
                // print("TEST");
                // submitDompet();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DompetTernak()),
                // );
                // Tambahkan aksi untuk tombol Submit di sini
                // print('Submit Pressed');
                // print('Date: ${selectedDate.toString()}');
                // print('Amount: ${_amountController.text}');
                // print('Category: ${_categoryController.text}');
                // print('Title: ${_titleController}');
                // print('Description: ${_descriptionController.text}');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onDateChanged(DateTime newDate) {
    setState(() {
      selectedDate = newDate;
    });
  }
}

class IncomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income Screen')),
      body: const Center(child: Text('This is the Income Screen')),
    );
  }
}

class ExpenseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Screen')),
      body: const Center(child: Text('This is the Expense Screen')),
    );
  }
}

class SubmitDompet extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onDateChanged;
  final TextEditingController amountController;
  final TextEditingController categoryController;
  final TextEditingController descriptionController;
  final TextEditingController titleController;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onSubmitPressed;

  SubmitDompet({
    required this.selectedDate,
    required this.onDateChanged,
    required this.amountController,
    required this.categoryController,
    required this.descriptionController,
    required this.titleController,
    this.onCancelPressed,
    this.onSubmitPressed,
  });

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
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 110,
                top: 100,
                child: Container(
                  width: 90,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF50BE92),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF73D5AE)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 134,
                top: 106,
                child: Text(
                  'Income',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 210,
                top: 100,
                child: Container(
                  width: 90,
                  height: 30,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEBEBEB)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 233,
                top: 106,
                child: Text(
                  'Expense',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
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
                      'Date',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 270,
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
                top: 202,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Amount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(left: 35),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CurrencyInputFormatter(),
                        ],
                        decoration: const InputDecoration(
                          hintText: 'Enter Amount',
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
                left: 22,
                top: 240,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(left: 30),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        controller: categoryController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Category',
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
                left: 22,
                top: 278,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(left: 55),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
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
                left: 22,
                top: 316,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 270,
                      margin: const EdgeInsets.only(left: 15),
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Description',
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
                    SubmitButton(
                        amountController: amountController,
                        categoryController: categoryController,
                        descriptionController: descriptionController,
                        titleController: titleController,
                        selectedDate: selectedDate),
                    const SizedBox(height: 16),
                  ],
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
      onDateChanged(picked);
    }
  }
}

class SubmitButton extends StatelessWidget {
  DateTime? selectedDate;

  final TextEditingController amountController,
      categoryController,
      descriptionController,
      titleController;

  SubmitButton(
      {required this.amountController,
      required this.categoryController,
      required this.descriptionController,
      required this.titleController,
      required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String? token = prefs.getString('jwtToken');
        const String path = '/diaryternak/diary';
        String? apiURL = Env.apiURL! + path;
        print(selectedDate);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => DompetTernak()),
        // );
      },
      child: Container(
        width: 323,
        height: 39,
        decoration: ShapeDecoration(
          color: const Color(0xFF50BE92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            const BoxShadow(
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

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    double value = double.parse(newValue.text);

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    String newText = formatter.format(value);

    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
