import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_view.dart';
import 'main_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60), // For top padding

                  // App Title or Logo
                  const Text(
                    "Login Gass",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Email Field
                  TextField(
                    onChanged: (value) => controller.email.value = value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),

                  // Password Field
                  TextField(
                    onChanged: (value) => controller.password.value = value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      // Navigation to Main Page on Login
                      if (controller.validateLogin()) {
                        Get.to(() => const MainView());
                      } else {
                        Get.snackbar("Error", "Invalid email or password");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue.shade900,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  const SizedBox(height: 10),

                  // Create Account Button
                  TextButton(
                    onPressed: () {
                      // Navigation to Register Page
                      Get.to(() => RegisterView());
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
