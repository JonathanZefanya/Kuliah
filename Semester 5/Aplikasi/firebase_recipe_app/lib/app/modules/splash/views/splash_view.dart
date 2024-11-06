import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/app/routes/app_pages.dart';
import 'package:recipe_app/app/utils/notification_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.firebaseInit();
    notificationService.getFirebaseToken().then((value) {
      print('Device Token: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.06), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.15, 
            ),
            Center(
              child: Container(
                height: screenHeight * 0.4,
                width: screenWidth * 0.8,   
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/text_bg_splash.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05, // Responsive spacing
            ),
            Text(
              'Selamat Datang',
              style: GoogleFonts.playfairDisplay(
                fontSize: screenWidth * 0.1, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Di Recipe App!',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: screenWidth * 0.1, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Highlight text with a modern color
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02, // Responsive spacing
            ),
            const Text(
              'Langsung masak juga bisa',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Text(
              'Mudah dan praktis',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const Spacer(), // Push the button to the bottom of the screen
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [Colors.greenAccent, Colors.teal],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
