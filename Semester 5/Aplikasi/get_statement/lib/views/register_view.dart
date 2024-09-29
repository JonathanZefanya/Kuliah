import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_view.dart';
import '../controllers/register_controller.dart';

class RegisterView extends StatelessWidget {
  final RegisterController controller = Get.put(RegisterController());

  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange.shade600, Colors.orange.shade900],
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

                  // Title
                  const Text(
                    "Create Account",
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
                  const SizedBox(height: 20),

                  // Confirm Password Field
                  TextField(
                    onChanged: (value) => controller.confirmPassword.value = value,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock_outline),
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

                  // Register Button
                  ElevatedButton(
                    onPressed: () {
                      if (controller.validateRegister()) {
                        Get.to(() => LoginView());
                      } else {
                        Get.snackbar("Error", "Invalid registration details");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.orange.shade900,
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  const SizedBox(height: 10),

                  // Already have account button
                  TextButton(
                    onPressed: () => Get.to(() => LoginView()),
                    child: const Text(
                      'Sudah punya akun? Login',
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
