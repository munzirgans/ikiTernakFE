import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ikiternak_apps/Screen/Login/login_screen.dart';

void main() {
  group('Login Screen Widget Tests', () {
    testWidgets('Login screen renders correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

      // Verify that the login screen has rendered properly.
      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('FORGOT PASSWORD?'), findsOneWidget);
      expect(find.text('Log In'), findsOneWidget);
      expect(find.text('SIGN UP'), findsOneWidget);
      expect(find.text('Login with'), findsOneWidget);
    });

    // Add more tests as needed.
  });
}
