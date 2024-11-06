import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/create/controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add New Recipe'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.titleController,
              labelText: 'Title',
              icon: Icons.title_outlined,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.descriptionController,
              labelText: 'Description',
              icon: Icons.description_outlined,
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.waktuController,
              labelText: 'Time',
              icon: Icons.timer_outlined,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.bahanController,
              labelText: 'Ingredients',
              icon: Icons.list_outlined,
              maxLines: 10,
            ),
            const SizedBox(height: 20),
            _buildTextField(
              controller: controller.langkahController,
              labelText: 'Steps',
              icon: Icons.format_list_numbered_outlined,
              maxLines: 20,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () => controller.addData(
                controller.titleController.text,
                controller.descriptionController.text,
                controller.waktuController.text,
                controller.bahanController.text,
                controller.langkahController.text,
              ),
              child: const Text('Add Recipe', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: 'Enter the recipe $labelText',
        prefixIcon: Icon(icon, color: Colors.indigo),
        filled: true,
        fillColor: Colors.indigo.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: maxLines,
    );
  }
}
