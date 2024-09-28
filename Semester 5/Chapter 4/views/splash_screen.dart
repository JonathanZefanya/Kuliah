import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'obx.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => Page1Obx());
    });
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('Welcome to State Managements', style: TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}
