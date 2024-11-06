import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/create/controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => controller.title.value = value,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              onChanged: (value) => controller.description.value = value,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 16),
            Text(
              'Mood',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => controller.setMood(0), // Sedih
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: controller.selectedMood.value == 0
                            ? Colors.yellow[200]
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '😢',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.setMood(1), // Netral
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: controller.selectedMood.value == 1
                            ? Colors.yellow[200]
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '😐',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.setMood(2), // Senang
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: controller.selectedMood.value == 2
                            ? Colors.yellow[200]
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '😊',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                ],
              );
            }),
            Spacer(),
            Obx(() {
              return ElevatedButton(
                onPressed: controller.title.isNotEmpty &&
                        controller.description.isNotEmpty
                    ? controller.savePost
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text('Save'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
