// Andhika Ardianto
import 'package:firebase_auth/firebase_auth.dart'; // Mengimpor paket Firebase Auth untuk autentikasi
import 'package:firebase_application/app/modules/login/controllers/login_controller.dart'; // Mengimpor kontroler login
import 'package:firebase_core/firebase_core.dart'; // Mengimpor paket inti Firebase
import 'package:flutter/material.dart'; // Mengimpor Flutter Material untuk UI
import 'package:get/get.dart'; // Mengimpor GetX untuk manajemen state dan navigasi
import 'app/routes/app_pages.dart'; // Mengimpor rute aplikasi
import 'app/utils/loading.dart'; // Mengimpor tampilan loading
import 'firebase_options.dart'; // Mengimpor opsi konfigurasi Firebase

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Memastikan binding Flutter diinisialisasi
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Menginisialisasi Firebase dengan opsi yang sesuai dengan platform
  );
  runApp(MyApp()); // Menjalankan aplikasi
}

// Kelas MyApp sebagai widget utama aplikasi
class MyApp extends StatelessWidget {
  final authC = Get.put(LoginController(),
      permanent:
          true); // Menggunakan GetX untuk mengelola LoginController secara permanen

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: authC
            .streamAuthStatus, // Menggunakan StreamBuilder untuk mendengarkan status autentikasi
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Memeriksa apakah stream sedang aktif
            print(snapshot); // Mencetak snapshot untuk debugging
            return GetMaterialApp(
              debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
              title: "Application", // Judul aplikasi
              initialRoute: snapshot.data != null &&
                      snapshot.data!.emailVerified ==
                          true // Menentukan rute awal berdasarkan status autentikasi
                  ? Routes
                      .HOME // Jika pengguna terverifikasi, arahkan ke halaman utama
                  : Routes.LOGIN, // Jika tidak, arahkan ke halaman login
              getPages: AppPages.routes, // Mengatur rute aplikasi
              theme: ThemeData(
                primarySwatch: Colors.indigo, // Mengatur tema aplikasi
              ),
            );
          }
          return LoadingView(); // Menampilkan tampilan loading jika status koneksi belum aktif
        });
  }
}
