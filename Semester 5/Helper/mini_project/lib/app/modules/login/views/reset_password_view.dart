import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class ResetPasswordView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reset Password")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  Get.snackbar("Error", "Email harus diisi");
                } else {
                  authController.resetPassword(emailController.text);
                }
              },
              child: Text("Reset Password"),
            ),
          ],
        ),
      ),
    );
  }
}
