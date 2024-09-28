import 'package:get/get.dart';

class TextController extends GetxController {
  var text = 'Hello'.obs;

  void toggleCase() {
    if (text.value == text.value.toLowerCase()) {
      text.value = text.value.toUpperCase();
    } else {
      text.value = text.value.toLowerCase();
    }
  }
}
