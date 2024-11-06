import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  RxBool isPasswordHidden = true.obs;
  RxBool isConfirmPasswordHidden = true.obs;

  void register(String username, String email, String password,
      String confirmPassword) async {
    if (password != confirmPassword) {
      Get.snackbar(
        'Error',
        'Passwords do not match!',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
      return;
    }

    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = userCredential.user!.uid;
      await firestore.collection('users').doc(uid).set({
        'username': username,
        'email': email,
      });

      if (username == username) {
        Get.snackbar(
          'Error',
          'Username already exists!',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
        return;
      }

      await userCredential.user!.sendEmailVerification();

      Get.snackbar(
        'Success',
        'Registration successful! Please verify your email.',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );

      Get.offAllNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          margin: EdgeInsets.all(12),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
