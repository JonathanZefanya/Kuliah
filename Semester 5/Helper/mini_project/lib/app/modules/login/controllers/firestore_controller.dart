import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getDataStream() {
    return firestore.collection('moments').snapshots();
  }

  Future<void> addData(String name, String title, String description) async {
    await firestore.collection('moments').add({
      'name': name,
      'title': title,
      'description': description,
    });
  }
}
