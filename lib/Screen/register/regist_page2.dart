import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikiternak_apps/Screen/Login/login_screen.dart';
import 'package:http/http.dart' as http;

class RegistScreen2 extends StatefulWidget {
  const RegistScreen2({super.key});

  @override
  _RegistScreenState createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen2> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _birthdateController = TextEditingController();
  String? _selectedGender = 'Select'; // Set initial value to 'Select'
  final TextEditingController _addressController = TextEditingController();

  Future<void> registerUser() async {
    const String apiURL = "http://192.168.18.23:3000/auth/register";
    final Map<String, dynamic> userData = {
      'Fullname': _fullnameController.text,
      'email': _birthdateController.text,
      'username': _selectedGender == 'Select' ? '' : _selectedGender,
      'password': _addressController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print("Berhasil registrasi!");
      } else {
        print("Tidak berhasil registrasi!");
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/kandang_background.png",
            fit: BoxFit.cover,
          ),
          ClipRect(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF50BE92).withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ),
          _buildLogo(),
          _buildLoginBox(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 40,
      left: 0,
      right: 0,
      child: Image.asset(
        'assets/images/ikiternak_logo.png',
        height: 200,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildLoginBox() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: _buildLoginContainer(),
    );
  }

  Widget _buildLoginContainer() {
    return Container(
      height: 590,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFFF8F8F8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildWelcomeText(),
          _buildLoginText(),
          _buildInputField(
              'Full name', _fullnameController, 'Your Full Name', false),
          _buildInputField(
              'Birthdate', _birthdateController, 'MM/DD/YYYY', true),
          _buildGenderDropdown('Gender'),
          _buildInputField(
              'Address', _addressController, 'Your Address', false),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              registerUser();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF50BE92),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: Text(
              'Sign Up',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _buildSignUpText(),
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.poppins(
              color: const Color(0xFF303E2B),
              fontSize: 8,
              fontWeight: FontWeight.w400,
            ),
            children: const <TextSpan>[
              TextSpan(text: 'Already Have a Account? '),
              TextSpan(
                text: 'Sign In Here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF009FEE),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Text(
        "Join IkiTernak!",
        style: GoogleFonts.poppins(
          color: const Color(0xFF50BE92),
          fontSize: 16,
          fontWeight: FontWeight.w600,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Text(
        "Buat akun Anda sekarang!",
        style: GoogleFonts.poppins(
          color: const Color(0xFF5B5B5B),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, TextEditingController controller,
      String hintText, bool isBirthdateInput) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF50BE92), width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: controller,
              obscureText:
                  labelText == 'Password' || labelText == 'Confirm Password',
              readOnly: isBirthdateInput,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(
                  color: const Color(0xFF999999),
                  fontSize: 10,
                ),
                border: InputBorder.none,
              ),
              onTap: () {
                if (isBirthdateInput) {
                  _selectDate(context, controller);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenderDropdown(String labelText) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF50BE92), width: 1.0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedGender,
                items: <String>['Select', 'Laki-laki', 'Perempuan']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: GoogleFonts.poppins(
                        color: value == 'Select'
                            ? const Color(0xFF999999)
                            : Colors.black,
                        fontSize: 10,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue == 'Select' ? null : newValue;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1900),
      lastDate: currentDate,
    );

    if (picked != null && picked != currentDate) {
      String formattedDate = "${picked.month}/${picked.day}/${picked.year}";
      controller.text = formattedDate;
    }
  }
}

void main() {
  runApp(const MaterialApp(
    home: RegistScreen2(),
  ));
}
