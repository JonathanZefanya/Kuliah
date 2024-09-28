import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dialog.dart';

class Page2Snackbar extends StatelessWidget {
  const Page2Snackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Hello', 'Traveller',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const Text('Show Snackbar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.to(const Page3Dialog()),
              child: const Text('Go to Dialog Page'),
            ),
          ],
        ),
      ),
    );
  }
}
