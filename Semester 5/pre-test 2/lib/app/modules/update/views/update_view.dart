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
        title: const Text('Update Recipe'),
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
            controller.waktuController.text = data['waktu'];
            controller.bahanController.text = data['bahan'];
            controller.langkahController.text = data['langkah'];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Update Your Recipe',
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
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: controller.waktuController,
                    label: 'Waktu',
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: controller.bahanController,
                    label: 'Bahan',
                    maxLines: 3,
                  ),
                  const SizedBox(height: 15),
                  _buildTextField(
                    controller: controller.langkahController,
                    label: 'Langkah',
                    maxLines: 4,
                  ),
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
                    onPressed: () => controller.updateData(
                      docID,
                      controller.titleController.text,
                      controller.descriptionController.text,
                      controller.waktuController.text,
                      controller.bahanController.text,
                      controller.langkahController.text,
                    ),
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
}
