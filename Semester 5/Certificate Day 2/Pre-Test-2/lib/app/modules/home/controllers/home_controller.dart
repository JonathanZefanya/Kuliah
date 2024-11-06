import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_application/app/modules/login/views/login_view.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;

  RxString username = ''.obs;
  RxString users = ''.obs;
  RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsername();
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

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('posts');
    return data.orderBy('time', descending: true).snapshots();
  }

  Stream<QuerySnapshot<Object?>> streamFilteredData(String query) {
    CollectionReference postsRef = firestore.collection('posts');
    return postsRef
        .where('title', isGreaterThanOrEqualTo: query.toLowerCase())
        .where('title', isLessThanOrEqualTo: query.toLowerCase() + '\uf8ff')
        .snapshots();
  }

  // void deleteData(String docID) {
  //   try {
  //     Get.defaultDialog(
  //       title: "Delete Post",
  //       middleText: "Are you sure you want to delete this post?",
  //       onConfirm: () async {
  //         // Dapatkan dokumen yang ingin dihapus untuk memperoleh photoUrl
  //         DocumentSnapshot docSnapshot = await firestore.collection('posts').doc(docID).get();
  //         String? photoUrl = docSnapshot['photoUrl'];

  //         // Jika ada photoUrl, hapus file dari Firebase Storage
  //         if (photoUrl != null && photoUrl.isNotEmpty) {
  //           try {
  //             await storage.refFromURL(photoUrl).delete();
  //           } catch (e) {
  //             print("Error deleting image from Firebase Storage: $e");
  //             Get.snackbar(
  //               'Error',
  //               'Failed to delete image from Firebase Storage',
  //               snackPosition: SnackPosition.BOTTOM,
  //               duration: Duration(seconds: 2),
  //               margin: EdgeInsets.all(12),
  //             );
  //           }
  //         }
  //         firestore.collection('posts').doc(docID).delete();
  //         Get.back();
  //         Get.snackbar(
  //           'Success',
  //           'Data deleted successfully',
  //           snackPosition: SnackPosition.BOTTOM,
  //           duration: Duration(seconds: 2),
  //           margin: EdgeInsets.all(12),
  //         );
  //       },
  //       textConfirm: "Yes, I'm sure",
  //       textCancel: "No",
  //     );
  //   } catch (e) {
  //     print(e);
  //     Get.snackbar(
  //       'Error',
  //       'Cannot delete this post',
  //       snackPosition: SnackPosition.BOTTOM,
  //       duration: Duration(seconds: 2),
  //       margin: EdgeInsets.all(12),
  //     );
  //   }
  // }

  void deleteData(String docID) async {
    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection('posts').doc(docID).get();
      String? postUsername = docSnapshot['user'];

      if (postUsername == username.value) {
        Get.defaultDialog(
          title: "Delete Post",
          middleText: "Are you sure you want to delete this post?",
          onConfirm: () async {
            String? photoUrl = docSnapshot['photoUrl'];

            if (photoUrl != null && photoUrl.isNotEmpty) {
              try {
                await storage.refFromURL(photoUrl).delete();
              } catch (e) {
                print("Error deleting image from Firebase Storage: $e");
                Get.snackbar(
                  'Error',
                  'Failed to delete image from Firebase Storage',
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                  margin: EdgeInsets.all(12),
                );
              }
            }
            await firestore.collection('posts').doc(docID).delete();
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
      } else {
        Get.defaultDialog(
          title: "Permission Denied",
          middleText: "You are not the owner of this post.",
          textConfirm: "OK",
          onConfirm: () => Get.back(),
        );
      }
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
