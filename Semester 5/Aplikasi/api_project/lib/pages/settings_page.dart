import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController settingsController = Get.find();

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Language:'.tr),
            ElevatedButton(
              onPressed: () {
                settingsController.changeLanguage('en');
              },
              child: const Text('English'),
            ),
            ElevatedButton(
              onPressed: () {
                settingsController.changeLanguage('id');
              },
              child: const Text('Bahasa Indonesia'),
            ),
          ],
        ),
      ),
    );
  }
}
