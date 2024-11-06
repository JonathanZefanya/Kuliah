import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_application/app/modules/create/controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 75, 75, 75),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Add Your Post',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 56, 57, 62),
                ),
              ),
            ),
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
            GestureDetector(
              onTap: controller.pickImage,
              child: Obx(() => Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: const Color.fromARGB(255, 2, 2, 2), width: 1),
                      image: controller.imageFile.value != null
                          ? DecorationImage(
                              image: FileImage(controller.imageFile.value!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: controller.imageFile.value == null
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add_a_photo_outlined,
                                    color: Colors.indigo, size: 40),
                                SizedBox(height: 8),
                                Text('Tap to add photo',
                                    style: TextStyle(color: Colors.indigo)),
                              ],
                            ),
                          )
                        : null,
                  )),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color.fromARGB(255, 71, 71, 71),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              onPressed: () => controller.uploadData(),
              child: const Text('Add Post', style: TextStyle(fontSize: 18)),
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
        hintText: 'Enter the post $labelText',
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 79, 79, 79)),
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
