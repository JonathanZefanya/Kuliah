import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/reset_password/controllers/reset_password_controller.dart';

// Kelas ResetPasswordView untuk menangani antarmuka reset password
class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang dari layar reset password
      backgroundColor: Color.fromARGB(255, 109, 126, 252),
      body: Padding(
        // Padding di sekitar seluruh body
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 80), // Spasi dari atas
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Reset Password', // Teks judul
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10), // Spasi di bawah judul
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Forgot your password? Enter your email to reset it.', // Teks instruksi
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40), // Spasi sebelum kolom input email
            TextField(
              controller: controller.emailController, // Kolom input email
              decoration: InputDecoration(
                labelText: 'Email', // Label untuk kolom email
                labelStyle: const TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white70), // Warna border saat tidak fokus
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white), // Warna border saat fokus
                ),
              ),
              style: const TextStyle(
                  color: Colors.white), // Warna teks di kolom email
            ),
            const SizedBox(height: 40), // Spasi sebelum tombol reset password
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 16), // Padding vertikal untuk tombol
                backgroundColor: Colors.white, // Warna latar belakang tombol
                foregroundColor:
                    Color.fromARGB(255, 109, 126, 252), // Warna teks tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // Sudut tombol
                ),
              ),
              onPressed: () => controller.resetPassword(controller
                  .emailController.text), // Fungsi untuk mereset password
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Reset Password',
                      style: TextStyle(fontSize: 18)), // Teks pada tombol
                  SizedBox(width: 8), // Spasi antara teks dan ikon
                  Icon(Icons.arrow_forward), // Ikon panah
                ],
              ),
            ),
            const SizedBox(height: 20), // Spasi sebelum tombol kembali ke login
            TextButton(
              onPressed: () =>
                  Get.toNamed('/login'), // Navigasi ke halaman login
              child: const Text('Back to Login', // Teks untuk tombol kembali
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
