import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/app/utils/notification_api.dart';
import 'package:recipe_app/app/helper/db_helper.dart';
import 'package:recipe_app/app/data/notification.dart' as custom; // Import the Notification model with a prefix

class SettingPageController extends GetxController {
  final sarapanToggle = false.obs;
  final siangToggle = false.obs;
  final malamToggle = false.obs;

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

    // Load stored toggle states
    sarapanToggle.value = box.read('sarapan') ?? true;
    siangToggle.value = box.read('siang') ?? true;
    malamToggle.value = box.read('malam') ?? true;

    // Load stored times
    sarapanTime.value = _readTimeFromStorage('sarapanTime', const TimeOfDay(hour: 7, minute: 0));
    siangTime.value = _readTimeFromStorage('siangTime', const TimeOfDay(hour: 12, minute: 0));
    malamTime.value = _readTimeFromStorage('malamTime', const TimeOfDay(hour: 18, minute: 7));
  }

  TimeOfDay _readTimeFromStorage(String key, TimeOfDay defaultTime) {
    final storedTime = box.read(key);
    if (storedTime != null) {
      final timeParts = (storedTime as String).split(':');
      return TimeOfDay(hour: int.parse(timeParts[0]), minute: int.parse(timeParts[1]));
    }
    return defaultTime;
  }

  void pickTime(String type) async {
    final selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: type == 'sarapan'
          ? sarapanTime.value
          : type == 'siang'
              ? siangTime.value
              : malamTime.value,
    );

    if (selectedTime != null) {
      if (type == 'sarapan') {
        sarapanTime.value = selectedTime;
        box.write('sarapanTime', '${selectedTime.hour}:${selectedTime.minute}');
      } else if (type == 'siang') {
        siangTime.value = selectedTime;
        box.write('siangTime', '${selectedTime.hour}:${selectedTime.minute}');
      } else if (type == 'malam') {
        malamTime.value = selectedTime;
        box.write('malamTime', '${selectedTime.hour}:${selectedTime.minute}');
      }
    }
  }

  Future<void> toggleSarapan() async {
    sarapanToggle.toggle();
    box.write("sarapan", sarapanToggle.value);

    final db = DBHelper.instance;
    final scheduledTime = sarapanTime.value;

    if (sarapanToggle.value) {
      // Schedule notification
      await NotificationApi.scheduledNotification(
        id: 1,
        title: "Sarapan Pagi Penuh Energi",
        body: "Yuk Buat Sarapan Pagi Biar Badan Kamu Sehat 🥹",
        payload: "sarapan",
        scheduledTime: scheduledTime,
      ).then((value) async {
        // Save notification to DB
        await db.createNotification(custom.Notification(
            idRecipe: 1, time: '${sarapanTime.value.hour}:${sarapanTime.value.minute}'));
        Get.snackbar("Berhasil", "Pengingat sarapan berhasil diaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    } else {
      // Cancel notification
      NotificationApi.cancelNotification(1).then((value) async {
        await db.deleteNotification(1); // Delete notification from DB
        Get.snackbar("Berhasil", "Pengingat sarapan berhasil dinonaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    }
  }


  Future<void> toggleSiang() async {
    siangToggle.toggle();
    box.write("siang", siangToggle.value);

    final db = DBHelper.instance;
    final scheduledTime = siangTime.value; // Use TimeOfDay directly

    if (siangToggle.value) {
      // Schedule the notification
      await NotificationApi.scheduledNotification(
        id: 2,
        title: "Ayo Makan Siang",
        body: "Jangan lupa makan siang ya sayang 🥰, nanti badan kamu lemas",
        payload: "siang",
        scheduledTime: scheduledTime, // Use scheduledTime here
      ).then((value) async {
        // Save to the database
        await db.createNotification(custom.Notification(idRecipe: 2, time: '${siangTime.value.hour}:${siangTime.value.minute}'));
        Get.snackbar("Berhasil", "Pengingat makan siang berhasil diaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    } else {
      // Cancel the notification and delete from the database
      NotificationApi.cancelNotification(2).then((value) async {
        await db.deleteNotification(2); // Delete the notification from the database
        Get.snackbar("Berhasil", "Pengingat makan siang berhasil dinonaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    }
  }

  Future<void> toggleMalam() async {
    malamToggle.toggle();
    box.write("malam", malamToggle.value);

    final db = DBHelper.instance;
    final scheduledTime = malamTime.value; // Use TimeOfDay directly

    if (malamToggle.value) {
      // Schedule the notification
      await NotificationApi.scheduledNotification(
        id: 3,
        title: "Yuk Dinner Sayang...",
        body: "Jangan lupa makan malam ya ❤, nanti tidurnya akan lebih nyenyak",
        payload: "malam",
        scheduledTime: scheduledTime, // Use scheduledTime here
      ).then((value) async {
        // Save to the database
        await db.createNotification(custom.Notification(idRecipe: 3, time: '${malamTime.value.hour}:${malamTime.value.minute}'));
        Get.snackbar("Berhasil", "Pengingat makan malam berhasil diaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    } else {
      // Cancel the notification and delete from the database
      NotificationApi.cancelNotification(3).then((value) async {
        await db.deleteNotification(3); // Delete the notification from the database
        Get.snackbar("Berhasil", "Pengingat makan malam berhasil dinonaktifkan",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      });
    }
  }

}
