import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/register/controllers/register_controller.dart';

// Kelas RegisterView untuk menangani antarmuka pendaftaran
class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Mengatur warna latar belakang dari layar pendaftaran
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
                'Register', // Teks judul
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
                'Create your account', // Teks subjudul
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 40), // Spasi sebelum kolom input
            TextField(
              controller: controller.usernameController, // Kolom input username
              decoration: InputDecoration(
                labelText: 'Username', // Label untuk kolom username
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
                  color: Colors.white), // Warna teks di kolom username
            ),
            const SizedBox(height: 20), // Spasi antara kolom username dan email
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
            const SizedBox(
                height: 20), // Spasi sebelum kolom konfirmasi password
            Obx(() => TextField(
                  obscureText: controller.isConfirmPasswordHidden
                      .value, // Menyembunyikan teks konfirmasi password
                  controller: controller
                      .confirmPasswordController, // Kolom input konfirmasi password
                  decoration: InputDecoration(
                    labelText:
                        'Confirm Password', // Label untuk kolom konfirmasi password
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
                        controller.isConfirmPasswordHidden.value
                            ? Icons
                                .visibility_off // Ikon untuk menyembunyikan konfirmasi password
                            : Icons
                                .visibility, // Ikon untuk menampilkan konfirmasi password
                        color: Colors.white70,
                      ),
                      onPressed: () {
                        // Mengubah status visibilitas konfirmasi password
                        controller.isConfirmPasswordHidden.value =
                            !controller.isConfirmPasswordHidden.value;
                      },
                    ),
                  ),
                  style: const TextStyle(
                      color: Colors
                          .white), // Warna teks di kolom konfirmasi password
                )),
            const SizedBox(height: 40), // Spasi sebelum tombol daftar
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
              onPressed: () => controller.register(
                // Fungsi untuk menangani pendaftaran
                controller.usernameController.text,
                controller.emailController.text,
                controller.passwordController.text,
                controller.confirmPasswordController.text,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Register',
                      style: TextStyle(fontSize: 18)), // Teks pada tombol
                  SizedBox(width: 8), // Spasi antara teks dan ikon
                  Icon(Icons.arrow_forward), // Ikon panah
                ],
              ),
            ),
            const SizedBox(height: 20), // Spasi sebelum bagian login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "Already have an account?", // Teks untuk bagian login
                    style: TextStyle(color: Colors.white70)),
                TextButton(
                  onPressed: () =>
                      Get.back(), // Navigasi kembali ke halaman login
                  child: const Text('Login',
                      style: TextStyle(
                          color: Colors.white)), // Teks untuk tombol login
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
