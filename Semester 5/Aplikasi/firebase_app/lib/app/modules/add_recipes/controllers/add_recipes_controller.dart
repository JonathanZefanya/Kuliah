import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRecipesController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController ingredientsController;
  late TextEditingController time_estimateController;
  late TextEditingController intructionsController;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    ingredientsController = TextEditingController();
    time_estimateController = TextEditingController();
    intructionsController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    ingredientsController.dispose();
    time_estimateController.dispose();
    intructionsController.dispose();
    super.onClose();
  }

  void clearControllers() {
    titleController.clear();
    descriptionController.clear();
    ingredientsController.clear();
    time_estimateController.clear();
    intructionsController.clear();
  }

  void addRecipe() async {
    try {
      await firestore.collection('recipes').add({
        'title': titleController.text,
        'description': descriptionController.text,
        'ingredients': ingredientsController.text,
        'time_estimate': time_estimateController.text,
        'instructions': intructionsController.text,
      });
      Get.back();
      Get.snackbar('Success', "Recipe added successfully");
      clearControllers();
    } on Exception catch (e) {
      Get.snackbar('Error', "Error adding recipe ");
      print(e);
    }
  }
}
