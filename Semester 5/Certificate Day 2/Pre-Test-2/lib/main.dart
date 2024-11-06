// main.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_application/app/modules/login/controllers/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(), permanent: true);
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: SplashScreen(),
      getPages: AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
