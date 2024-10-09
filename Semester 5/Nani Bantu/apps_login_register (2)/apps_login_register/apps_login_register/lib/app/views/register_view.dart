import 'package:apps_login_register/app/routes/app_routes.dart' as app_routes;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/controllers/auth_controller.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Create Account',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (authController.errorMessage.isNotEmpty) {
                      return Text(
                        authController.errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      );
                    }
                    return const SizedBox.shrink(); // Widget kosong jika tidak ada error
                  }),
                  ElevatedButton(
                    onPressed: () {
                      authController.register(usernameController.text, passwordController.text);
                    },
                    child: const Text('Create Account'),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(app_routes.AppRoutes.login); // Navigasi ke halaman login
                    },
                    child: const Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
