import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Layout/alert_dialog.dart';
import 'package:ikiternak_apps/Screen/Profile/profile.dart';
import 'package:ikiternak_apps/environtment.dart';
import 'package:ikiternak_apps/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const UbahPassword());
}

class UbahPassword extends StatelessWidget {
  const UbahPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          ChangePassword(),
        ]),
      ),
    );
  }
}

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  FocusNode currentPasswordFocus = FocusNode();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  bool isCurrentPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  bool isPasswordMismatch = false;

  void submitChangePassword() {
    var token = prefs.getString('jwtToken');
    const String path = '/users/changepassword';
    String? apiURL = Env.apiURL! + path;
    final Map<String, dynamic> data = {
      'current': currentPasswordController.text,
      'new': newPasswordController.text,
    };
    try {
      http
          .post(Uri.parse(apiURL),
              headers: {
                "Content-type": "application/json",
                'Authorization': 'Bearer $token'
              },
              body: jsonEncode(data))
          .then((response) {
        var jsonResponse = jsonDecode(response.body);
        if (response.statusCode == 200) {
          AlertDialogWidget.showAlertDialog(
              context, "Success", "Successfully change password!");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Userprofile()));
        } else {
          AlertDialogWidget.showAlertDialog(
              context, "Error", jsonResponse['message']);
        }
      });
    } catch (error) {
      AlertDialogWidget.showAlertDialog(
          context, "Error", "Internal Server Error!");
    }
  }

  @override
  void dispose() {
    currentPasswordFocus.dispose();
    newPasswordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
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
              buildPositionedTextField(
                controller: currentPasswordController,
                hintText: 'Input Current Password',
                title: 'Current Password',
                focusNode: currentPasswordFocus,
                isPassword: true,
                isVisible: isCurrentPasswordVisible,
                toggleVisibility: () {
                  togglePasswordVisibility('current');
                },
                hintFontSize: 12.0, // Set the font size of the hintText
                hintTextPosition: const EdgeInsets.only(
                    top: 5.0), // Set the position of the hintText
              ),
              buildPositionedTextField(
                controller: newPasswordController,
                hintText: 'Input New Password',
                title: 'New Password',
                focusNode: newPasswordFocus,
                topPosition: 248,
                isPassword: true,
                isVisible: isNewPasswordVisible,
                toggleVisibility: () {
                  togglePasswordVisibility('new');
                },
                hintFontSize: 12.0,
                hintTextPosition: const EdgeInsets.only(top: 5.0),
              ),
              buildPositionedTextField(
                controller: confirmPasswordController,
                hintText: 'Confirm New Password',
                title: 'Confirm Password',
                focusNode: confirmPasswordFocus,
                topPosition: 337,
                isPassword: true,
                isVisible: isConfirmPasswordVisible,
                toggleVisibility: () {
                  togglePasswordVisibility('confirm');
                },
                hintFontSize: 12.0,
                hintTextPosition: const EdgeInsets.only(top: 5.0),
              ),
              if (isPasswordMismatch)
                const Positioned(
                  left: 38,
                  top: 410,
                  child: Text(
                    'Passwords do not match',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              const Positioned(
                left: 26,
                top: 90,
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 51,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Userprofile()),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 33,
                top: 753,
                child: SizedBox(
                  width: 323,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle submit button tap
                      String currentPassword = currentPasswordController.text;
                      String newPassword = newPasswordController.text;
                      String confirmPassword = confirmPasswordController.text;

                      if (newPassword == confirmPassword) {
                        // Passwords match, proceed with the submission
                        submitChangePassword();
                        setState(() {
                          isPasswordMismatch = false;
                        });

                        // Show success dialog
                      } else {
                        // Passwords do not match, show error message
                        setState(() {
                          isPasswordMismatch = true;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF50BE92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Submit',
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Function to show success dialog
  Future<void> _showSuccessDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Password Updated'),
          content: const Text('Your password has been successfully updated.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
                // Navigate to UserProfile
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Userprofile()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Positioned buildPositionedTextField({
    required TextEditingController controller,
    required String hintText,
    required String title,
    required FocusNode focusNode,
    double topPosition = 160,
    bool isPassword = false,
    required bool isVisible,
    required Function toggleVisibility,
    double hintFontSize = 10.0,
    EdgeInsets hintTextPosition = EdgeInsets.zero,
  }) {
    return Positioned(
      left: 34,
      top: topPosition,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 323,
            height: 40,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                TextField(
                  controller: controller,
                  style: const TextStyle(color: Colors.black),
                  focusNode: focusNode,
                  cursorColor: const Color.fromARGB(
                      255, 0, 0, 0), // Set the desired cursor color
                  obscureText: !isVisible,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(
                            255, 0, 0, 0), // Set the desired focus color
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF50BE92),
                        width: 1,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: const Color(0xFF999999),
                      fontSize: hintFontSize,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    labelStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(right: 12.0) + hintTextPosition,
                  child: GestureDetector(
                    onTap: () {
                      toggleVisibility();
                    },
                    child: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void togglePasswordVisibility(String field) {
    setState(() {
      switch (field) {
        case 'current':
          isCurrentPasswordVisible = !isCurrentPasswordVisible;
          break;
        case 'new':
          isNewPasswordVisible = !isNewPasswordVisible;
          break;
        case 'confirm':
          isConfirmPasswordVisible = !isConfirmPasswordVisible;
          break;
      }
    });
  }
}
