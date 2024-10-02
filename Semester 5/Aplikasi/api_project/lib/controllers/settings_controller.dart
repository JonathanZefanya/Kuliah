import 'dart:ui';

import 'package:get/get.dart';

class SettingsController extends GetxController implements Translations {
  // Method to change language
  void changeLanguage(String langCode) {
    var locale = Locale(langCode);
    Get.updateLocale(locale);
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'List Meal From API': 'List Meal From API',
          'Settings': 'Settings',
          'Choose Language:': 'Choose Language:',
        },
        'id': {
          'List Meal From API': 'Daftar Makanan Dari API',
          'Settings': 'Pengaturan',
          'Choose Language:': 'Pilih Bahasa:',
        }
      };
}
