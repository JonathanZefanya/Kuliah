import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D2A91),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: <Color>[Colors.orangeAccent, Colors.purpleAccent],
                    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Create your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40),
            _buildTextField(
              controller: controller.usernameController,
              label: 'Username',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.emailController,
              label: 'Email',
              obscureText: false,
            ),
            const SizedBox(height: 20),
            Obx(() => _buildTextField(
                  controller: controller.passwordController,
                  label: 'Password',
                  obscureText: controller.isPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      controller.isPasswordHidden.value =
                          !controller.isPasswordHidden.value;
                    },
                  ),
                )),
            const SizedBox(height: 20),
            Obx(() => _buildTextField(
                  controller: controller.confirmPasswordController,
                  label: 'Confirm Password',
                  obscureText: controller.isConfirmPasswordHidden.value,
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isConfirmPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      controller.isConfirmPasswordHidden.value =
                          !controller.isConfirmPasswordHidden.value;
                    },
                  ),
                )),
            const SizedBox(height: 40),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFFFF5B8C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => controller.register(
                  controller.usernameController.text,
                  controller.emailController.text,
                  controller.passwordController.text,
                  controller.confirmPasswordController.text,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Register', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(color: Colors.white70)),
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Login',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
