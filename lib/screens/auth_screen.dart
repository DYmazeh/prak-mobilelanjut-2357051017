
import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/main.dart'; // Ganti import

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLogin = true;
  bool _isLoading = false;
  bool _isPasswordObscured = true;
  String? _statusMessage;

  void _snack(String text) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _submit() async {
    // ... (validasi tetap sama)
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _snack('Email dan Password wajib diisi.');
      return;
    }
    if (!_emailController.text.contains('@')) {
      _snack('Masukkan email yang valid.');
      return;
    }
    if (_passwordController.text.length < 6) {
      _snack('Password minimal 6 karakter.');
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = null;
    });

    try {
      if (_isLogin) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()), // Perbaikan di sini
          );
        }
      } else {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainScreen()), // Perbaikan di sini
          );
        }
      }
    } on FirebaseAuthException catch (e, s) {
      setState(() {
        if (e.code == 'user-not-found') {
          _statusMessage = 'Email tidak ditemukan.';
        } else if (e.code == 'wrong-password') {
          _statusMessage = 'Password yang Anda masukkan salah.';
        } else if (e.code == 'email-already-in-use') {
          _statusMessage = 'Email sudah terdaftar. Silakan masuk.';
        } else if (e.code == 'weak-password') {
          _statusMessage = 'Password terlalu lemah.';
        } else {
          _statusMessage = 'Terjadi kesalahan otentikasi. Coba lagi.';
        }
        developer.log(
          'FirebaseAuthException',
          name: 'auth.firebase',
          error: e,
          stackTrace: s,
        );
      });
    } catch (e, s) {
      setState(() {
        _statusMessage = 'Terjadi kesalahan tidak terduga.';
      });
      developer.log(
        'Generic Auth Error',
        name: 'auth.generic',
        error: e,
        stackTrace: s,
      );
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _buildHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.person, size: 46, color: Colors.white),
        ),
        const SizedBox(height: 12),
        Text(
          _isLogin ? 'Selamat Datang' : 'Buat Akun Baru',
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          _isLogin
              ? 'Silakan masuk untuk melanjutkan'
              : 'Isi data untuk membuat akun',
          style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passwordController,
          obscureText: _isPasswordObscured,
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordObscured = !_isPasswordObscured;
                });
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        _isLoading
            ? const CircularProgressIndicator()
            : SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(_isLogin ? 'Masuk' : 'Daftar'),
                ),
              ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
              _statusMessage = null;
            });
          },
          child: Text(_isLogin
              ? 'Belum punya akun? Daftar'
              : 'Sudah punya akun? Masuk'),
        ),
        if (_statusMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            _statusMessage!,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'Masuk' : 'Daftar'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 28),
                    _buildForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
