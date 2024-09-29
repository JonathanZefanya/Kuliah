import 'package:get/get.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  bool validateLogin() {
    return GetUtils.isEmail(email.value) && password.value.length >= 6;
  }
}
