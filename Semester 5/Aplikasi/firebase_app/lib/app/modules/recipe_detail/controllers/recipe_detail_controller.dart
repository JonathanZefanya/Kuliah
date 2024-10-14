import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RecipeDetailController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void onInit() {
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
}
