import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/controller.dart';
import 'snackbar.dart';

class Page1Obx extends StatelessWidget {
  final TextController controller = Get.put(TextController());

  Page1Obx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Obx')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(controller.text.value, style: const TextStyle(fontSize: 30))),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.toggleCase(),
              child: const Text('Toggle Case'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(const Page2Snackbar()),
              child: const Text('Go to Snackbar Page'),
            ),
          ],
        ),
      ),
    );
  }
}
