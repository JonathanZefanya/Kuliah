import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'water_page.dart';
import 'package:pretest/controllers/ice_scream_controllers.dart';

class IceCreamPage extends StatelessWidget {
  // Instance dari controller
  final IceCreamController controller = Get.put(IceCreamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar besar di bagian atas
          Positioned.fill(
            child: Image.asset(
              'assets/images/ice-cream.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // Box putih tebal di bagian bawah yang menutupi sebagian gambar
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 400, // Mengatur tinggi box agar lebih tebal
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95), // Warna semi transparan lebih tebal
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Row untuk menampilkan "328 kcal" di kiri dan "100g" di kanan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Menggunakan Obx untuk menampilkan nilai kalori yang berubah
                      Obx(() => Text(
                        '${controller.kcal.value} kcal',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      // Dropdown untuk memilih berat es krim
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: DropdownButton<int>(
                          value: controller.selectedWeight.value,
                          icon: Icon(Icons.arrow_drop_down),
                          underline: SizedBox(),
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              controller.updateValues(newValue);
                            }
                          },
                          items: <int>[100, 150, 200, 250].map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text('$value g', style: TextStyle(fontSize: 18)),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  
                  // Judul "Ice Cream" di bagian tengah
                  Center(
                    child: Text(
                      'Ice Cream',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Bagian nutrisi dengan lingkaran di sekelilingnya
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNutritionCircle('Protein', controller.protein, Colors.orange),
                      _buildNutritionCircle('Carbs', controller.carbs, Colors.purple),
                      _buildNutritionCircle('Fat', controller.fat, Colors.black),
                    ],
                  ),
                  SizedBox(height: 40),
                  // Tombol Add to meal
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke WaterBalancePage
                        Get.to(WaterBalancePage());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        'Add to meal',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan info nutrisi dalam lingkaran
  Widget _buildNutritionCircle(String label, RxInt value, Color color) {
    return Column(
      children: [
        // Lingkaran dengan teks di dalamnya
        Obx(() => Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Text(
              '${value.value}g',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
