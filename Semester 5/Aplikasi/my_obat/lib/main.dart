import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/notification_service.dart';
import 'views/schedule_page.dart';
import 'views/add_schedule_page.dart';
import 'views/settings_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Obat Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SchedulePage()),
        GetPage(name: '/add', page: () => AddSchedulePage()),
        GetPage(name: '/settings', page: () => SettingsPage()),
      ],
    );
  }
}
