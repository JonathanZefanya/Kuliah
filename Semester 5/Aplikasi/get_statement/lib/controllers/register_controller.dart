import 'package:get/get.dart';

class RegisterController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  bool validateRegister() {
    return GetUtils.isEmail(email.value) && password.value.length >= 6 && password.value == confirmPassword.value;
  }
}
