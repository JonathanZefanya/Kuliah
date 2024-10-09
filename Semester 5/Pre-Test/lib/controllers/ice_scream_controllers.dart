import 'package:get/get.dart';

class IceCreamController extends GetxController {
  // Variabel untuk menyimpan berat yang dipilih
  var selectedWeight = 100.obs;

  // Nilai default untuk kalori, protein, karbohidrat, dan lemak (per 100g)
  var kcal = 328.obs;
  var protein = 12.obs;
  var carbs = 16.obs;
  var fat = 17.obs;

  // Method untuk mengupdate nilai berdasarkan berat yang dipilih
  void updateValues(int weight) {
    selectedWeight.value = weight;
    kcal.value = (328 * weight / 100).round();
    protein.value = (12 * weight / 100).round();
    carbs.value = (16 * weight / 100).round();
    fat.value = (17 * weight / 100).round();
  }
}
