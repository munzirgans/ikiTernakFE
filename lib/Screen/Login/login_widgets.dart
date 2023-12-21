// login_widgets.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikiternak_apps/Screen/register/regist_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future signIn() async {
  await GoogleSignIn().signIn();
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

Widget buildLoginWithText() {
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
                onTap: () {
                  // Handle Facebook login
                  FacebookAuth.instance.login(
                      permissions: ["public_profile", "email"]).then((value) {
                    FacebookAuth.instance.getUserData().then((userData) {
                      print(userData);
                    });
                  });
                },
                child: Image.asset('assets/icon/facebook_icon.png', height: 30),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // Handle Google login
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
