// login_widgets.dart

import 'dart:convert';
// import 'dart:js_util';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:ikiternak_apps/Screen/Layout/alert_dialog.dart';
import 'package:ikiternak_apps/Screen/register/regist_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ikiternak_apps/api/google_signin_api.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'package:http/http.dart' as http;
import 'package:ikiternak_apps/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future signInGoogle(BuildContext context, SharedPreferences prefs) async {
  final user = await GoogleSignInAPI.login();
  const String path = "/auth/login";
  String? apiURL = Env.apiURL! + path;
  final Map<String, dynamic> data = {
    'name': user?.displayName,
    'email': user?.email,
    'is_socmed': 1,
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
      } else {
        AlertDialogWidget.showAlertDialog(
            context, "Error", jsonResponse['message']);
      }
    });
  } catch (error) {
    print('Error: $error');
  }
}

Widget buildLogo() {
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

Widget buildWelcomeText() {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Text(
      "Welcome!",
      style: GoogleFonts.poppins(
        color: const Color(0xFF50BE92),
        fontSize: 16,
        fontWeight: FontWeight.w600,
        decoration: TextDecoration.none,
      ),
    ),
  );
}

Widget buildLoginText() {
  return Padding(
    padding: const EdgeInsets.only(top: 0.0),
    child: Text(
      "Please Log in to Your Account!",
      style: GoogleFonts.poppins(
        color: const Color(0xFF5B5B5B),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.none,
      ),
    ),
  );
}

Widget buildSignUpText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegistScreen()),
          );
        },
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.poppins(
              color: const Color(0xFF303E2B),
              fontSize: 8,
              fontWeight: FontWeight.w400,
            ),
            children: const <TextSpan>[
              TextSpan(text: 'Don’t Have an Account? '),
              TextSpan(
                text: 'Sign Up Here',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xFF009FEE),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget buildLoginWithText(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 20.0),
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
                TextSpan(text: "Or Log in With:"),
              ],
            ),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  await facebookHandle(context, prefs);
                },
                child: Image.asset('assets/icon/facebook_icon.png', height: 30),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () async {
                  // Handle Google login
                  await signInGoogle(context, prefs);
                },
                child: Image.asset('assets/icon/google_icon.png', height: 30),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Future<void> facebookHandle(
    BuildContext context, SharedPreferences prefs) async {
  Map<String, dynamic>? userData = {};
  FacebookAuth.instance
      .login(permissions: ["public_profile", "email"]).then((value) {
    FacebookAuth.instance.getUserData().then((fbuserData) {
      userData = fbuserData.isNotEmpty ? fbuserData : null;
      if (userData != null) {
        const String path = "/auth/login";
        String? apiURL = Env.apiURL! + path;
        final Map<String, dynamic> data = {
          'name': userData!['name'],
          'email': userData!['email'],
          'is_socmed': 1,
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
              prefs.setString("jwtToken", token);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
            } else {
              AlertDialogWidget.showAlertDialog(
                  context, "Error", jsonResponse['message']);
            }
          });
        } catch (error) {
          print('Error: $error');
        }
      }
    });
  });
}
