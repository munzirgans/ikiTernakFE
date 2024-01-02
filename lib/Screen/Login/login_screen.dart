// login_screen.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Layout/alert_dialog.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'login_widgets.dart';
import 'login_input.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    const String path = '/auth/login';
    String? apiURL = Env.apiURL! + path;
    final Map<String, dynamic> data = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };
    try {
      http
          .post(Uri.parse(apiURL),
              headers: {'Content-type': 'application/json'},
              body: jsonEncode(data))
          .then((response) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          var token = jsonResponse['jwtToken'];
          prefs.setString('jwtToken', token);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DashboardScreen()));
        } else {
          AlertDialogWidget.showAlertDialog(
              context, "Error", jsonResponse['message']);
        }
      });
    } catch (error) {
      AlertDialogWidget.showAlertDialog(context, "Error", error.toString());
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
          buildLogo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
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
                  buildWelcomeText(),
                  buildLoginText(),
                  Padding(
                    padding: const EdgeInsets.only(top: 36.0),
                    child: Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  buildInputField('Your Username', _usernameController),
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Password',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  buildInputField('Your Password', _passwordController),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'FORGOT PASSWORD?',
                      style: TextStyle(
                        color: Color(0xFF009FEE),
                        fontSize: 8,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      signIn(context);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const DashboardScreen()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50BE92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: const Size(double.infinity, 43),
                    ),
                    child: Text(
                      'Log In',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  buildSignUpText(context),
                  buildLoginWithText(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
