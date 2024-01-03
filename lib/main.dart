import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ikiternak_apps/Screen/LaunchApp/launch_screen.dart';
import 'package:ikiternak_apps/Screen/Login/login_screen.dart';
import 'package:ikiternak_apps/Screen/register/regist_screen.dart';
import 'package:ikiternak_apps/Screen/Homepage/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
void main() async {
  await dotenv.load();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

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
        '/register': (context) => RegistScreen(),
        '/dashborad': (context) => const DashboardScreen(),
      },
    );
  }
}
