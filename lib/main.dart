
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/diagnose_screen.dart';
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/more_screen.dart';
import 'package:myapp/screens/my_garden_screen.dart';
import 'package:myapp/widgets/bottom_nav_bar.dart';
import 'firebase_options.dart';
import 'package:myapp/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mola',
      // 1. Definisikan tema terang (opsional, tapi baik untuk dimiliki)
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 2. Definisikan tema gelap yang lebih detail
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green, // Warna aksen tetap hijau
        scaffoldBackgroundColor: const Color(0xFF121212), // Latar belakang gelap standar
        cardColor: const Color(0xFF1E1E1E), // Warna kartu sedikit lebih terang
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E1E1E),
          elevation: 0,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey[600],
          type: BottomNavigationBarType.fixed, // Agar background terlihat
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // 3. Atur aplikasi untuk selalu menggunakan tema gelap
      themeMode: ThemeMode.dark,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            return const MainScreen();
          }
          return const AuthScreen();
        },
      ),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const MyGardenScreen(),
    const DiagnoseScreen(),
    const MoreScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
