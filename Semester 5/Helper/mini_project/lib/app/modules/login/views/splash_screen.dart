import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/login'); // Pindah ke halaman login setelah 3 detik
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Ubah warna latar sesuai preferensi
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 100), // Logo splash screen
            SizedBox(height: 20),
            Text(
              'Koleksiku/nPunyaku',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
