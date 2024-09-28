import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottomsheet.dart';

class Page3Dialog extends StatelessWidget {
  const Page3Dialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Hello',
                  middleText: 'This is a dialog',
                );
              },
              child: const Text('Show Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(const Page4BottomSheet()),
              child: const Text('Go to BottomSheet Page'),
            ),
          ],
        ),
      ),
    );
  }
}
