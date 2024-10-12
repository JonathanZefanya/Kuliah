import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myobat/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyObat'),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Obx(
        () {
            if (controller.listMedicines.isEmpty) {
            return Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                'assets/images/nahida.jpeg',
                width: 150,
                height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                'Jangan Lupa Minum Obat-Nya Sayang ❤',
                style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
              ),
            );
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: controller.listMedicines.length,
              itemBuilder: (context, index) {
                final medicine = controller.listMedicines[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      medicine.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      "${medicine.frequency.toString()} kali sehari",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
                    onTap: () => Get.toNamed(Routes.DETAIL_MEDICINE,
                        arguments: medicine.id),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_SCHEDULE);
        },
        backgroundColor: const Color.fromARGB(255, 18, 210, 0),
        child: const Icon(Icons.add),
      ),
    );
  }
}
