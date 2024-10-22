import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/app/utils/notification_api.dart';
import 'package:recipe_app/app/utils/notification_services.dart'; // Import NotificationService
import 'package:timezone/data/latest.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize GetStorage and ScreenUtil
  await GetStorage.init();
  await ScreenUtil.ensureScreenSize();
  
  // Initialize Local Notifications
  await NotificationApi.init();
  initializeTimeZones();
  
  // Initialize Firebase with default options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Initialize Firebase Cloud Messaging and request notification permissions
  NotificationService notificationService = NotificationService();
  NotificationController().onInit();
  notificationService.requestNotificationPermission(); // Request permission
  notificationService.firebaseInit(); // Initialize Firebase messaging
  notificationService.getFirebaseToken(); // Get FCM token
  notificationService.isTokenRefreshed(); // Handle token refresh

  // test notification
  NotificationApi.showNotification(
    id: 999,
    title: 'Test Notification',
    body: 'This is a test notification',
    payload: 'Test Payload',
  );

  // Start the app
  runApp(
    ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)
              .copyWith(background: Colors.white),
        ),
      ),
    ),
  );
}

ThemeData _buildThemeData(brightness) {
  final ThemeData base = ThemeData(brightness: brightness);
  return base.copyWith(
    textTheme: GoogleFonts.robotoTextTheme(base.textTheme),
  );
}
