// diary_ternak_button.dart
import 'package:flutter/material.dart';
import 'constant.dart';

class DompetTernakButton extends StatelessWidget {
  final bool isActive;
  final String buttonText;
  final VoidCallback onPressed;

  const DompetTernakButton({
    super.key,
    required this.isActive,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(buttonWidth, buttonHeight),
        backgroundColor: isActive ? activeColor : inactiveColor,
        foregroundColor: isActive ? inactiveColor : inactiveTextColor,
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
