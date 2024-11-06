import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_screen2.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

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
                Image.asset('assets/splash1.jpg'),
                const SizedBox(height: 20),
                const Text(
                  'Selamat datang di CiptaCuan\nMulai atur keuangan Anda dengan cara yang lebih mudah dan aman.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: () {
                Get.off(
                    () => const SplashScreen2()); // Pindah ke splash screen 2
              },
              child: const Text(
                'Lewati',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
