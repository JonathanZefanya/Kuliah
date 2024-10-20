import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_application/app/modules/update/controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
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
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!;
            controller.titleController.text = data['title'];
            controller.descriptionController.text = data['description'];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      'Update Your Recipe',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller.titleController,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter the recipe title',
                      prefixIcon: const Icon(Icons.title_outlined, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.indigo.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller.descriptionController,
                    maxLines: 10,  // Larger description input
                    minLines: 5,   // Minimum height for better UX
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Enter the recipe description',
                      prefixIcon: const Icon(Icons.description_outlined, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.indigo.shade50,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                    TextField(
                    controller: controller.waktuController,
                    decoration: InputDecoration(
                      labelText: 'Time',
                      hintText: 'Enter the cooking time',
                      prefixIcon: const Icon(Icons.timer_outlined, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.indigo.shade50,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                      ),
                    ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                    controller: controller.bahanController,
                    maxLines: 10,  // Larger ingredients input
                    minLines: 5,   // Minimum height for better UX
                    decoration: InputDecoration(
                      labelText: 'Ingredients',
                      hintText: 'Enter the recipe ingredients',
                      prefixIcon: const Icon(Icons.list_outlined, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.indigo.shade50,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                      ),
                    ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                    controller: controller.waktuController,
                    maxLines: 10,  // Larger steps input
                    minLines: 5,   // Minimum height for better UX
                    decoration: InputDecoration(
                      labelText: 'Steps',
                      hintText: 'Enter the recipe steps',
                      prefixIcon: const Icon(Icons.format_list_numbered_outlined, color: Colors.indigo),
                      filled: true,
                      fillColor: Colors.indigo.shade50,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                      ),
                    ),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    icon: const Icon(Icons.save_outlined),
                    label: const Text(
                      'Save Changes',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => controller.updateData(
                      Get.arguments,
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
}
