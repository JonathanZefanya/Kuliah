import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  Rxn<File> imageFile = Rxn<File>();
  RxString username = ''.obs;
  RxInt selectedEmotIndex = 1.obs;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  void fetchUsername() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData =
          await firestore.collection('users').doc(user.uid).get();
      username.value = userData['username'] ?? 'Guest';
    } else {
      username.value = 'Guest';
    }
  }

  Future<void> uploadData() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        imageFile.value == null) {
      Get.snackbar(
        'Error',
        'Please fill all fields and select an image',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
      return;
    }

    try {
      String dateNow = DateTime.now().toString();

      // Upload foto ke Firebase Storage
      String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      TaskSnapshot snapshot =
          await storage.ref(fileName).putFile(imageFile.value!);
      String photoUrl = await snapshot.ref.getDownloadURL();

      // Simpan data ke Firestore dengan username dan emot
      await firestore.collection('posts').add({
        'title': titleController.text,
        'description': descriptionController.text,
        'photoUrl': photoUrl,
        'user': username.value,
        'time': dateNow,
        'emot': selectedEmotIndex.value, // Tambahkan emot ke data
      });

      Get.back();
      Get.snackbar(
        'Success',
        'Data added successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );

      // Bersihkan data setelah upload
      titleController.clear();
      descriptionController.clear();
      imageFile.value = null;
      selectedEmotIndex.value = 1;
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to upload data',
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
    fetchUsername(); // Ambil username saat inisialisasi
    super.onInit();
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
