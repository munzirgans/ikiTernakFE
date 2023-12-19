import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/Login/login_screen.dart';

class LaunchScreenPage extends StatefulWidget {
  const LaunchScreenPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LaunchScreenPageState createState() => _LaunchScreenPageState();
}

class _LaunchScreenPageState extends State<LaunchScreenPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), // 2 seconds animation duration
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      _goToLoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF50BE92),
      child: Center(
        child: AnimatedBuilder(
          animation: _opacityAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _opacityAnimation.value,
              child: child,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/ikiternak_logo.png'),
            ],
          ),
        ),
      ),
    );
  }

  void _goToLoginScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
