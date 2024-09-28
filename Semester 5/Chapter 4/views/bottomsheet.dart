import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_statement/views/obx.dart';

class Page4BottomSheet extends StatelessWidget {
  const Page4BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Sheet Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    color: Colors.white,
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.wb_sunny),
                          title: const Text('Sun'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(Icons.wb_cloudy),
                          title: const Text('Cloud'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Text('Show Bottom Sheet'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(Page1Obx());
              },
              child: const Text('Back to OBX'),
            ),
          ],
        ),
      ),
    );
  }
}
