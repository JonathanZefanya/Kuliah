import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print('Message Title: ${message.notification!.title}');
        print('Message Body: ${message.notification!.body}');
      }
    });
  }

  // Retrieve the Firebase Cloud Messaging token
  Future<String> getFirebaseToken() async {
    String? token = await messaging.getToken();
    if (token != null) {
      print('Firebase Token: $token');
    }
    return token!;
  }

  void isTokenRefreshed() {
    messaging.onTokenRefresh.listen((String newToken) {
      print('FCM Token refreshed: $newToken');
    });
  }

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
