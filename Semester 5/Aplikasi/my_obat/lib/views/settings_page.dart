import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/constants.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General Settings',
              style: AppConstants.headingStyle,
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            ListTile(
              title: const Text(
                'Enable Notifications',
                style: AppConstants.subheadingStyle,
              ),
              trailing: Switch(
                value: true,
                onChanged: (val) {
                  // Logic to toggle notifications
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Change Language',
                style: AppConstants.subheadingStyle,
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.defaultDialog(
                  title: 'Select Language',
                  content: Column(
                    children: [
                      ListTile(
                        title: const Text('English'),
                        onTap: () {
                          // Logic to change language to English
                          Get.back();
                        },
                      ),
                      ListTile(
                        title: const Text('Indonesian'),
                        onTap: () {
                          // Logic to change language to Indonesian
                          Get.back();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'About App',
                style: AppConstants.subheadingStyle,
              ),
              trailing: const Icon(Icons.info),
              onTap: () {
                Get.defaultDialog(
                  title: 'About',
                  content: const Text(
                    'This is a scheduling app built with Flutter. It supports notification scheduling and task management.',
                    style: AppConstants.bodyTextStyle,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
