import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_application/app/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isPasswordHidden = true.obs;

  Stream<User?> get streamAuthStatus =>
      FirebaseAuth.instance.authStateChanges();

  void login(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (userCredential.user!.emailVerified) {
        Get.snackbar(
          'Success',
          'User logged in successfully',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
        Get.offAllNamed(Routes.HOME);
      } else if (userCredential.user!.emailVerified == false) {
        Get.snackbar(
          'Error',
          'Please verify your email',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
      } else if (userCredential.user!.emailVerified &&
        userCredential.user!.email != email) {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Wrong email provided for that user.',
          textConfirm: 'OK',
          onConfirm: () {
            Get.back();
          },
        );
      } else if (userCredential.user!.emailVerified &&
          userCredential.user!.email == email) {
        Get.defaultDialog(
          title: 'Error',
          middleText: 'Wrong password provided for that user.',
          textConfirm: 'OK',
          onConfirm: () {
        Get.back();
          },
        );
      } else {
        Get.snackbar(
          'Error',
          'Please verify your email',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('wrong email');
        Get.snackbar(
          'Error',
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
      } else if (e.code == 'wrong-password') {
        print('wrong password');
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
      } else if (e.code == 'too-many-requests') {
        print('too-many-requests');
        Get.snackbar(
          'Error',
          'Too many requests. Try again later.',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          margin: const EdgeInsets.all(12),
        );
      }
      print(e.code);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}