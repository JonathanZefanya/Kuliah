import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/category_list_page.dart';
// import 'pages/settings_page.dart';
import 'controllers/settings_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Meal Categories',
      initialBinding: BindingsBuilder(() {
        Get.put(SettingsController()); // Initialize Settings Controller
      }),
      locale: const Locale('en'), // Default locale
      translations: SettingsController(), // Localization setup
      home: const CategoryListPage(),
    );
  }
}
