import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CreateController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  RxString title = ''.obs;
  RxString description = ''.obs;
  RxInt selectedMood = 1.obs; // Default mood: Happy (1)

  void savePost() async {
    User? user = auth.currentUser;
    if (user != null) {
      try {
        await firestore.collection('posts').add({
          'userId': user.uid,
          'username': await getUsername(),
          'title': title.value,
          'description': description.value,
          'mood': selectedMood.value, // Save selected mood
          'time': FieldValue.serverTimestamp(),
        });
        Get.back();
        Get.snackbar(
          'Success',
          'Post created successfully',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      } catch (e) {
        print(e);
        Get.snackbar(
          'Error',
          'Failed to create post',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      }
    }
  }

  Future<String> getUsername() async {
    DocumentSnapshot userData =
        await firestore.collection('users').doc(auth.currentUser!.uid).get();
    return userData['username'] ?? 'Guest';
  }

  void setMood(int mood) {
    selectedMood.value = mood;
  }
}
