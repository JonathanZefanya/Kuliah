import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/login/controllers/login_controller.dart';

// Kelas LoginView untuk menangani antarmuka login
class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang dari layar login
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
                'Login', // Teks judul
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
                'Selamat datang kembali,\nSilakan login ke akun Anda', // Teks subjudul
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40), // Spasi sebelum kolom input
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
            const SizedBox(height: 20), // Spasi antara kolom email dan password
            Obx(() => TextField(
                  obscureText: controller
                      .isPasswordHidden.value, // Menyembunyikan teks password
                  controller:
                      controller.passwordController, // Kolom input password
                  decoration: InputDecoration(
                    labelText: 'Password', // Label untuk kolom password
                    labelStyle: const TextStyle(color: Colors.white70),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color:
                              Colors.white70), // Warna border saat tidak fokus
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white), // Warna border saat fokus
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.isPasswordHidden.value
                            ? Icons
                                .visibility_off // Ikon untuk menyembunyikan password
                            : Icons
                                .visibility, // Ikon untuk menampilkan password
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        // Mengubah status visibilitas password
                        controller.isPasswordHidden.value =
                            !controller.isPasswordHidden.value;
                      },
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors.white), // Warna teks di kolom password
                )),
            const SizedBox(height: 20), // Spasi sebelum tombol "Lupa Password"
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Get.toNamed(
                    '/reset-password'), // Navigasi ke halaman reset password
                child: const Text('Lupa password?',
                    style: TextStyle(
                        color:
                            Colors.white70)), // Teks untuk tombol lupa password
              ),
            ),
            const SizedBox(height: 20), // Spasi sebelum tombol login
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
              onPressed: () => controller.login(controller.emailController.text,
                  controller.passwordController.text), // Fungsi login
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Login',
                      style: TextStyle(fontSize: 18)), // Teks pada tombol
                  SizedBox(width: 8), // Spasi antara teks dan ikon
                  Icon(Icons.arrow_forward), // Ikon panah
                ],
              ),
            ),
            const SizedBox(height: 20), // Spasi sebelum bagian pendaftaran
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Belum punya akun?",
                    style: TextStyle(
                        color: Colors.white70)), // Teks untuk pendaftaran
                TextButton(
                  onPressed: () => Get.toNamed(
                      '/register'), // Navigasi ke halaman pendaftaran
                  child: const Text('Daftar',
                      style: TextStyle(
                          color: Colors.white)), // Teks untuk tombol daftar
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
