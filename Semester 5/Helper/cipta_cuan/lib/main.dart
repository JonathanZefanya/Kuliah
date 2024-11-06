import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Import untuk navigasi rute
import 'splash_screen.dart'; // Import splash screen pertama

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CiptaCuan',
      theme: ThemeData(
        primaryColor:
            const Color(0xFF0A0E21), // Warna biru navy sebagai tema utama
      ),
      home: const SplashScreen(), // Memulai aplikasi dari splash screen pertama
      getPages: AppPages.routes, // Menyediakan navigasi halaman
    );
  }
}
