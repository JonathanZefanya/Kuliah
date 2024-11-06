import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController timeestimationController;
  late TextEditingController instructionsController;
  late TextEditingController ingredientnsController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection('resep').doc(docID);
    return docRef.get();
  }

  void updateData(String docID, String title, String timeestimation, String instructions,
      String ingredients) async {
    try {
      await firestore.collection('resep').doc(docID).update({
        'title': title,
        'time_estimation': timeestimation,
        'instructions': instructions,
        'ingredients': ingredients
      });

      Get.back();
      Get.snackbar('Success', 'Data updated successfully');
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed updating data');
    }
  }

  @override
  void onInit() {
    titleController = TextEditingController();
    timeestimationController = TextEditingController();
    instructionsController = TextEditingController();
    ingredientnsController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
  titleController.dispose();
    timeestimationController.dispose();
    instructionsController.dispose();
    ingredientnsController.dispose();
    super.onClose();
  }
}