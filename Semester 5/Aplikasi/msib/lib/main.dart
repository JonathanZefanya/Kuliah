// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'dart:async'; // Untuk Timer
import 'page/homepage.dart'; // Impor halaman utama

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(), // Halaman awal adalah SplashScreen
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer untuk berpindah halaman setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo aplikasi
            Image.asset(
              'assets/logo/logo.png', // Sesuaikan dengan path logo Anda
              height: 120,
            ),
            const SizedBox(height: 20),
            // Ganti SpinKit dengan CircularProgressIndicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
