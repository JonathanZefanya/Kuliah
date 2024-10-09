import 'package:apps_login_register/app/routes/app_routes.dart' as app_routes;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/controllers/auth_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            Obx(() {
              if (authController.errorMessage.isNotEmpty) {
                return Text(
                  authController.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              }
              return const SizedBox.shrink(); 
            }),
            ElevatedButton(
              onPressed: () {
                authController.login(usernameController.text, passwordController.text);
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(app_routes.AppRoutes.register); 
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
