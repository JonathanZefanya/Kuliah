import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/meal_list_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(const MealApp());
}

class MealApp extends StatelessWidget {
  const MealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',  // Modern font for cleaner UI
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MealListPage()),
        GetPage(name: '/settings', page: () => SettingsPage()),
      ],
    );
  }
}