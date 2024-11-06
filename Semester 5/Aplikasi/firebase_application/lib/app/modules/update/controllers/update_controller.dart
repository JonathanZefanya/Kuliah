import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController waktuController;
  late TextEditingController bahanController;
  late TextEditingController langkahController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('posts').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String description, String waktu, String bahan, String langkah ) async {
    try {
      await firestore.collection('posts').doc(docID).update({
        'title': title,
        'description': description,
        'waktu': waktu,
        'bahan': bahan,
        'langkah': langkah,
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed updating data',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } 
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    waktuController = TextEditingController();
    bahanController = TextEditingController();
    langkahController = TextEditingController();
    super.onInit();
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
