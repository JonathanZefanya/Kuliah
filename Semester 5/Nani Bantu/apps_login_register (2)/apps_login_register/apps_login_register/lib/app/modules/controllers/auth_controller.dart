import 'package:get/get.dart';
import 'package:apps_login_register/app/routes/app_routes.dart' as app_routes;

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var errorMessage = ''.obs;

  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Username and password cannot be empty.';
      return;
    }

    if (username == 'user' && password == 'password') {
      isLoggedIn.value = true;
      errorMessage.value = ''; 
      Get.offAllNamed(app_routes.AppRoutes.home); 
    } else {
      errorMessage.value = 'Invalid username or password.';
    }
  }

  void register(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      errorMessage.value = 'Username and password cannot be empty.';
      return;
    }

    isLoggedIn.value = true;
    errorMessage.value = ''; 
    Get.offAllNamed(app_routes.AppRoutes.home); 
  }
}
