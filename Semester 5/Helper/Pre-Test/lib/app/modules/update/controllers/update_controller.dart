import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final mood = 1.obs; // Default mood: Happy

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(Map<String, dynamic> arguments) async {
    String docID = arguments['docID'];
    var snapshot = await firestore.collection('posts').doc(docID).get();
    if (snapshot.exists) {
      // Populate fields if document exists
      titleController.text = snapshot['title'] ?? '';
      descriptionController.text = snapshot['description'] ?? '';
      mood.value = snapshot['mood'] ?? 1; // Default to happy if no mood
    }
    return snapshot;
  }

  // Fungsi untuk memperbarui data di Firestore
  Future<void> updateData(String docID) async {
    try {
      await firestore.collection('posts').doc(docID).update({
        'title': titleController.text,
        'description': descriptionController.text,
        'mood': mood.value,
      });
      Get.snackbar(
        "Success",
        "Post updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.back();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update post",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void setMood(int newMood) {
    mood.value = newMood;
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
