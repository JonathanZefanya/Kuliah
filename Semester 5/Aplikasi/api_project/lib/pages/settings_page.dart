import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Change Language'),
            trailing: DropdownButton<String>(
              value: Get.locale?.languageCode,
              onChanged: (value) {
                if (value == 'id') {
                  Get.updateLocale(const Locale('id', 'ID'));
                } else {
                  Get.updateLocale(const Locale('en', 'US'));
                }
              },
              items: const [
                DropdownMenuItem(
                  value: 'en',
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: 'id',
                  child: Text('Indonesian'),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}