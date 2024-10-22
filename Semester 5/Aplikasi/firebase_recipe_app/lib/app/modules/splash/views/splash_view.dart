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
    notificationService.getFirebaseToken().then((value){
      print('Device Token: $value');
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.06), // Responsive padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.15, // Responsive spacing at the top
            ),
            Center(
              child: Container(
                height: screenHeight * 0.4, // Responsive image height
                width: screenWidth * 0.8,   // Responsive image width
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.8,
                  ),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bg_splash.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05, // Responsive spacing
            ),
            Text(
              'Discover Our',
              style: GoogleFonts.playfairDisplay(
                fontSize: screenWidth * 0.1, // Responsive font size
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.3,  // Responsive width for the image
                  height: screenHeight * 0.05, // Responsive height for the image
                  child: Image.asset(
                    'assets/images/text_bg_splash.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.03, // Responsive spacing between elements
                ),
                Text(
                  'Food World!',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: screenWidth * 0.1, // Responsive font size
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.02, // Responsive spacing
            ),
            const Text(
              'Find the best food for your health',
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              'Easy to cook and delicious to eat!',
              style: TextStyle(fontSize: 18),
            ),
            const Spacer(), // Push the button to the bottom of the screen
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.HOME);
              },
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }
}
