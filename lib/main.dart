import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Justduit',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F6F8),
        primaryColor: const Color(0xFF1E88FF),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1E88FF)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      initialRoute: LoginScreen.route,
      routes: {
        LoginScreen.route: (context) => const LoginScreen(),
        SignupScreen.route: (context) => const SignupScreen(),
        DashboardScreen.route: (context) => const DashboardScreen(),
      },
    );
  }
}
