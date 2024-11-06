import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen1.dart'; // Import screen berikutnya

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Beri waktu 3 detik sebelum berpindah ke screen berikutnya
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const SplashScreen1()); // Pindah ke splash screen pertama
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Warna biru navy
      body: Center(
        child: Text(
          'CiptaCuan',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent, // Sesuaikan warna teks sesuai gambar
          ),
        ),
      ),
    );
  }
}
