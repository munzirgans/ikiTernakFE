import 'package:flutter/material.dart';
import 'package:ikiternak_apps/Screen/LaunchApp/launch_screen.dart';
import 'package:ikiternak_apps/Screen/Login/login_screen.dart';
import 'package:ikiternak_apps/Screen/register/regist_screen.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LaunchScreenPage(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegistScreen(),
        '/dashborad': (context) => const DashboardScreen(),
      },
    );
  }
}
