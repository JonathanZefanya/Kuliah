import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Fungsi untuk login
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login berhasil");
      Get.offAllNamed('/home'); // Pindah ke halaman home setelah login
    } catch (e) {
      Get.snackbar("Error", "Login gagal: ${e.toString()}");
    }
  }

  // Fungsi untuk registrasi
  Future<void> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Success", "Registrasi berhasil");
      Get.offAllNamed('/home'); // Pindah ke halaman home setelah registrasi
    } catch (e) {
      Get.snackbar("Error", "Registrasi gagal: ${e.toString()}");
    }
  }

  // Fungsi untuk reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Success", "Email reset password telah dikirim");
    } catch (e) {
      Get.snackbar(
          "Error", "Gagal mengirim email reset password: ${e.toString()}");
    }
  }

  // Fungsi untuk logout
  Future<void> signOut() async {
    await _auth.signOut();
    Get.offAllNamed('/login'); // Kembali ke halaman login setelah logout
  }
}
