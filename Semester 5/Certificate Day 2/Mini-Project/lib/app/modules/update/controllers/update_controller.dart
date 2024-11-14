import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Rxn<File> imageFile = Rxn<File>();
  RxInt selectedEmotIndex = 1.obs;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<DocumentSnapshot<Object?>> getData(Map<String, dynamic> arguments) async {
    String docID = arguments['docID'];
    return await firestore.collection('posts').doc(docID).get();
  }

  Future<void> updateData(String docID, String title, String description, String? currentPhotoUrl) async {
    try {
      String? photoUrl = currentPhotoUrl;

      // Upload foto baru jika ada
      if (imageFile.value != null) {
        String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
        TaskSnapshot snapshot = await storage.ref(fileName).putFile(imageFile.value!);
        photoUrl = await snapshot.ref.getDownloadURL();
      }

      await firestore.collection('posts').doc(docID).update({
        'title': title,
        'description': description,
        'photoUrl': photoUrl,
        'emot': selectedEmotIndex.value, // Simpan index emot
      });

      Get.snackbar(
        "Success",
        "Post updated successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed('/home');
    } catch (e) {
      print("Update error: $e"); // Tambahkan log error
      Get.snackbar(
        "Error",
        "Failed to update post",
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
    super.onClose();
  }
}
