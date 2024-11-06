import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController timeestimationController;
  late TextEditingController instructionsController;
  late TextEditingController ingredientnsController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addData(String title, String timeestimation, String instructions,
      String ingredients) async {
    try {
      String dateNow = DateTime.now().toString();
      await firestore.collection('resep').add({
        'title': title,
        'time_estimation': timeestimation,
        'instructions': instructions,
        'ingredients': ingredients,
        'time': dateNow
      });

      Get.back();
      Get.snackbar('Success', 'Data added successfully');
      titleController.clear();
      timeestimationController.clear();
      instructionsController.clear();
      ingredientnsController.clear();
    } catch (e) {
      print(e);
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
