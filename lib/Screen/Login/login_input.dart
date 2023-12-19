// login_input.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildInputField(String labelText, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 5.0),
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFF50BE92),
          width: 1.0,
        ),
      ),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: labelText == 'Your Password',
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: labelText,
            hintStyle: GoogleFonts.poppins(
              color: const Color(0xFF999999),
              fontSize: 10,
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
