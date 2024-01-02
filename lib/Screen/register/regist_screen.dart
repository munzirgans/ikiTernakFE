import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ikiternak_apps/Screen/register/regist_page2.dart';

class RegistScreen extends StatefulWidget {
  const RegistScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistScreenState createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  // void initState(){

  // }
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
          _buildInputField('Username', _usernameController, 'Your Username'),
          _buildInputField(
              'Email', _emailController, 'Your Email. Ex : abcde@lalala.com'),
          _buildInputField('Password', _passwordController, 'Your Password'),
          _buildInputField('Confirm Password', _confirmPasswordController,
              'Confirm Password'),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegistScreen2(
                          username: _usernameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                        )),
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
              'Next',
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
              TextSpan(text: 'Already Have an Account? '),
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
        "Please Create Your Account First!",
        style: GoogleFonts.poppins(
          color: const Color(0xFF5B5B5B),
          fontSize: 10,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildInputField(
      String labelText, TextEditingController controller, String hintText) {
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
          TextFormField(
            controller: controller,
            obscureText:
                labelText == 'Password' || labelText == 'Confirm Password',
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: GoogleFonts.poppins(
                color: const Color(0xFF999999),
                fontSize: 10,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF50BE92), width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color(0xFF50BE92), width: 1.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
