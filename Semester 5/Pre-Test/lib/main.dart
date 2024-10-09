import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest/pages/water_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pre Test',
      home: WaterBalancePage(),
    );
  }
}
