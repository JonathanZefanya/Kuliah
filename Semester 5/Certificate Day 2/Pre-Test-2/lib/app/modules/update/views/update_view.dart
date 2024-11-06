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
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 70, 71, 75),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData({'docID': docID}),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!;
            controller.titleController.text = data['title'];
            controller.descriptionController.text = data['description'];
            String? photoUrl = data['photoUrl'];

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
                        color: const Color.fromARGB(255, 66, 67, 72),
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
                  GestureDetector(
                    onTap: controller.pickImage,
                    child: Obx(() => Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.indigo.shade50,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color.fromARGB(255, 62, 63, 71),
                                width: 1),
                            image: controller.imageFile.value != null
                                ? DecorationImage(
                                    image:
                                        FileImage(controller.imageFile.value!),
                                    fit: BoxFit.cover,
                                  )
                                : photoUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(photoUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                          ),
                          child: controller.imageFile.value == null &&
                                  photoUrl == null
                              ? Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.add_a_photo_outlined,
                                          color:
                                              Color.fromARGB(255, 78, 79, 80),
                                          size: 40),
                                      SizedBox(height: 8),
                                      Text('Tap to add photo',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 58, 58, 59))),
                                    ],
                                  ),
                                )
                              : null,
                        )),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color.fromARGB(255, 68, 69, 78),
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
                      photoUrl,
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
