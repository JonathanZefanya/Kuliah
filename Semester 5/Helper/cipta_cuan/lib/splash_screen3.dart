import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart'; // Halaman login

class SplashScreen3 extends StatelessWidget {
  const SplashScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Warna biru navy
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash3.jpg'), // Gambar sesuai
                const SizedBox(height: 20),
                const Text(
                  'Nabung Lebih Praktis\nNikmati kemudahan menabung dengan fitur pintar untuk mencapai tujuan finansial Anda.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Get.off(
                        () => const LoginScreen()); // Pindah ke login screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                  ),
                  child: const Text('Mulai'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
