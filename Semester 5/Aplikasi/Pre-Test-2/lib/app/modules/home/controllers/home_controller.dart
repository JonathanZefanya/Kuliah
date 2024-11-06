import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_application/app/modules/login/views/login_view.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  
  RxString username = ''.obs;
  RxString users = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
  }

  void fetchUsername() async {
    User? user = auth.currentUser;
    if (user != null) {
      DocumentSnapshot userData = await firestore.collection('users').doc(user.uid).get();
      username.value = userData['username'] ?? 'Guest';
    } else {
      username.value = 'Guest';
    }
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('posts');
    return data.orderBy('time', descending: true).snapshots();
  }

  Future<String> getUsernameByUserId(String userId) async {
    DocumentSnapshot userDoc = await firestore.collection('users').doc(userId).get();
    return userDoc.exists ? userDoc['username'] ?? 'Unknown' : 'Unknown';
  }



  void deleteData(String docID) {
    try {
      Get.defaultDialog(
        title: "Delete Post",
        middleText: "Are you sure you want to delete this post?",
        onConfirm: () {
          firestore.collection('posts').doc(docID).delete();
          Get.back();
          Get.snackbar(
            'Success',
            'Data deleted successfully',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 2),
            margin: EdgeInsets.all(12),
          );
        },
        textConfirm: "Yes, I'm sure",
        textCancel: "No",
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Cannot delete this post',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }

  void updateData(String docID, String title, String description) async {
    try {
      await firestore.collection('posts').doc(docID).update({
        'title': title,
        'description': description,
      });
      Get.snackbar(
        'Success',
        'Post updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      print(e);
      Get.snackbar(
        'Error',
        'Failed to update post',
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(12),
      );
    }
  }

  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }
}
