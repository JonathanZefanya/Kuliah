import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            Obx(() => TextField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible.value,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => isPasswordVisible.toggle(),
                    ),
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  Get.snackbar("Error", "Email dan Password harus diisi");
                } else {
                  authController.signIn(
                      emailController.text, passwordController.text);
                }
              },
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () => Get.toNamed('/register'),
              child: Text("Belum punya akun? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
