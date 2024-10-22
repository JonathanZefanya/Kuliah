import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/app/utils/notification_api.dart';

class SettingPageController extends GetxController {
  final sarapanTime = const TimeOfDay(hour: 7, minute: 0).obs;
  final siangTime = const TimeOfDay(hour: 12, minute: 0).obs;
  final malamTime = const TimeOfDay(hour: 18, minute: 0).obs;
  

  GetStorage box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    try {
      await NotificationApi.init();
    } catch (e) {
      print("Error initializing notifications: $e");
    }

    await _scheduleNotifications();
  }

  Future<void> _scheduleNotifications() async {
    // Schedule Sarapan Notification
    await NotificationApi.scheduledNotification(
      id: 1,
      title: "Sarapan Pagi Penuh Energi",
      body: "Yuk Buat Sarapan Pagi Biar Badan Kamu Sehat 🥹",
      payload: "sarapan",
      scheduledTime: sarapanTime.value,
    );

    // Schedule Siang Notification
    await NotificationApi.scheduledNotification(
      id: 2,
      title: "Ayo Makan Siang",
      body: "Jangan lupa makan siang ya sayang 🥰, nanti badan kamu lemas",
      payload: "siang",
      scheduledTime: siangTime.value,
    );

    // Schedule Malam Notification
    await NotificationApi.scheduledNotification(
      id: 3,
      title: "Yuk Dinner Sayang...",
      body: "Jangan lupa makan malam ya ❤, nanti tidurnya akan lebih nyenyak",
      payload: "malam",
      scheduledTime: malamTime.value,
    );
  }
}
