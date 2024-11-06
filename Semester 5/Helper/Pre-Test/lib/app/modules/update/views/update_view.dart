import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_application/app/modules/update/controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
    final String docID = Get.arguments['docID'] as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Update Post'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.indigo,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData({'docID': docID}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!;
            controller.titleController.text = data['title'];
            controller.descriptionController.text = data['description'];
            controller.mood.value = data['mood'] ?? 1; // Set mood default ke happy

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Update Your Post',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField(
                    controller: controller.titleController,
                    label: 'Title',
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: controller.descriptionController,
                    label: 'Description',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Mood',
                    style: TextStyle(fontSize: 16, color: Colors.indigo),
                  ),
                  const SizedBox(height: 10),
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMoodOption(
                          emoji: '😊',
                          moodValue: 1,
                          isSelected: controller.mood.value == 1,
                          onTap: () => controller.setMood(1),
                        ),
                        _buildMoodOption(
                          emoji: '😐',
                          moodValue: 2,
                          isSelected: controller.mood.value == 2,
                          onTap: () => controller.setMood(2),
                        ),
                        _buildMoodOption(
                          emoji: '😢',
                          moodValue: 3,
                          isSelected: controller.mood.value == 3,
                          onTap: () => controller.setMood(3),
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 5,
                    ),
                    icon: const Icon(Icons.save_outlined),
                    label: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => controller.updateData(docID),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.indigo),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.indigo),
        ),
      ),
    );
  }

  Widget _buildMoodOption({
    required String emoji,
    required int moodValue,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[200] : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(
          emoji,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
