import 'package:get/get.dart';

class WaterController extends GetxController {
  var waterConsumed = 5.obs; // Starting at 5 glasses
  final int totalGlasses = 8;

  int get totalMl => 2000; // Total target of water in ml

  int get currentMl => (waterConsumed.value / totalGlasses * totalMl).toInt();

  double get progress => waterConsumed.value / totalGlasses;

  void increment() {
    if (waterConsumed.value < totalGlasses) {
      waterConsumed.value++;
    }
  }

  void decrement() {
    if (waterConsumed.value > 0) {
      waterConsumed.value--;
    }
  }
}