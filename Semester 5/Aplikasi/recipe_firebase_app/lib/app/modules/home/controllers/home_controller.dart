import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

  Stream<QuerySnapshot> getRecipes() {
    try {
      return firestore.collection('recipes').snapshots();
    } catch (e) {
      // Handle the error here
      print('Error retrieving recipes: $e');
      return const Stream.empty();
    }
  }

  void deleteRecipe(String id) async {
    try {
      await firestore.collection('recipes').doc(id).delete();
      Get.back();
      Get.snackbar('Success', "Recipe deleted successfully");
    } on Exception catch (e) {
      Get.snackbar('Error', "Error deleting recipe ");
      print(e);
    }
  }
}
