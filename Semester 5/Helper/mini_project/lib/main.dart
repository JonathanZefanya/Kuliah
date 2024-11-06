import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart'; // Import untuk navigasi rute
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CiptaCuan',
      initialRoute: Routes.SPLASH,
      getPages: AppPages.routes, // Menyediakan navigasi halaman
    );
  }
}
