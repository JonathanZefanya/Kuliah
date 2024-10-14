import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateRecipesController extends GetxController {
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
    super.onClose();
  }

  Stream<DocumentSnapshot> getRecipe(String id) {
    try {
      return firestore.collection('recipes').doc(id).snapshots();
    } catch (e) {
      // Handle the error here
      print('Error retrieving recipe: $e');
      return const Stream.empty();
    }
  }

  void updateRecipe(String id) async {
    try {
      await firestore.collection('recipes').doc(id).update({
        'title': titleController.text,
        'description': descriptionController.text,
        'ingredients': ingredientsController.text,
        'time_estimate': time_estimateController.text,
        'instructions': intructionsController.text,
      });
      Get.back();
      Get.snackbar('Success', "Recipe updated successfully");
    } on Exception catch (e) {
      Get.snackbar('Error', "Error updating recipe ");
      print(e);
    }
  }
}
