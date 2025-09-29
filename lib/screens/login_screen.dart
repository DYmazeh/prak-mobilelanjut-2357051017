import 'package:flutter/material.dart';
import 'package:myapp/screens/signup_screen.dart';
import 'package:myapp/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/signin';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // komponen kecil buat label + tanda *
    Widget requiredLabel(String text) => Row(
          children: [
            Text(text, style: const TextStyle(fontSize: 13)),
            const Text(' *', style: TextStyle(color: Colors.red, fontSize: 13)),
          ],
        );

    // tombol biru dengan gradient (UI-only)
    Widget primaryButton(String label, VoidCallback onTap) => GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              gradient: const LinearGradient(
                colors: [Color(0xFF1E88FF), Color(0xFF2070FF)],
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1E88FF).withAlpha(64), // updated from withOpacity
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo-mola.png', // updated image path
                  height: 80,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 18),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Hi, Welcome Back to Justduit',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: 360,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13), // updated from withOpacity
                        blurRadius: 16,
                        offset: const Offset(0, 6),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      requiredLabel('Email Address'),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                        ),
                      ),
                      const SizedBox(height: 14),
                      requiredLabel('Password'),
                      const SizedBox(height: 6),
                      TextField(
                        controller: _pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),

                      primaryButton(
                        'Sign In Now',
                         () {
                          if (_email.text.isEmpty ||
                              _pass.text.isEmpty){
                            ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Email dan Password tidak boleh kosong!'),
                              backgroundColor: Colors.red,
                            ),
                            );
                          }else{
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              DashboardScreen.route,
                              (route) => false,
                              );
                          }
                      },
                      ),
                      const SizedBox(height: 14),
                      Center(
                        child: TextButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, SignupScreen.route),
                          child: const Text(
                            'Create New Account',
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
