import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final waktuController = TextEditingController();
  final bahanController = TextEditingController();
  final langkahController = TextEditingController();

 Future<DocumentSnapshot<Object?>> getData(Map<String, dynamic> arguments) async {
  String docID = arguments['docID'];
  return await FirebaseFirestore.instance.collection('posts').doc(docID).get();
}


  // Fungsi untuk memperbarui data di Firestore
  Future<void> updateData(
      String docID,
      String title,
      String description,
      String waktu,
      String bahan,
      String langkah) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(docID).update({
        'title': title,
        'description': description,
        'waktu': waktu,
        'bahan': bahan,
        'langkah': langkah,
      });
      Get.snackbar(
        "Success",
        "Recipe updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to update recipe",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    waktuController.dispose();
    bahanController.dispose();
    langkahController.dispose();
    super.onClose();
  }
}
