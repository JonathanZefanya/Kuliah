import 'package:apps/app/modules/login/views/login_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void logout() async {
    await auth.signOut();
    Get.off(() => LoginView());
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference data = firestore.collection('resep');
    return data.orderBy('time', descending: true).snapshots();
  }

  void deleteData(String docID) {
    try {
      Get.defaultDialog(
          title: "Delete Post",
          middleText: "Are you sure you want to delete this post?",
          onConfirm: () {
            firestore.collection('resep').doc(docID).delete();
            Get.back();
            Get.snackbar('Success', 'Data deleted successfully');
            // snackPosition: SnackPosition.BOTTOM,

          },
          textConfirm: "Yes, I'm sure",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.snackbar('Error', 'Cannot delete this post');
    }
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   var resepjson = <Map<String, dynamic>>[].obs;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   late TextEditingController titleC;
//   late TextEditingController ingredientsC;
//   late TextEditingController instructionC;
//   late TextEditingController timeEstimationC;

//   @override
//   void onInit() {
//     getResep();
//     titleC = TextEditingController();
//     ingredientsC = TextEditingController();
//     instructionC = TextEditingController();
//     timeEstimationC = TextEditingController();
//     super.onInit();
//   }

//   Future<void> getResep() async {
//     firestore.collection('resep').snapshots().listen((event) {
//       resepjson.value = event.docs.map(
//         (doc) {
//           var data = doc.data();
//           data['id'] = doc.id;
//           return data;
//         },
//       ).toList();
//     });
//   }

//   Future<void> addResep() async {
//     await firestore.collection('resep').add({
//       'iingredients': ingredientsC.text,
//       'instructions': instructionC.text,
//       'time_estimation': int.parse(timeEstimationC.text),
//       'title': titleC.text
//     });

//     ingredientsC.clear();
//     titleC.clear();
//     instructionC.clear();
//     timeEstimationC.clear();
//     Get.back();
//   }

//   Future<void> deleteResepById(String id) async {
//     try {
//       await firestore.collection('resep').doc(id).delete();
//       resepjson.removeWhere(
//         (element) => element['id'] == id,
//       );
//     } catch (e) {}
//   }

//   Future<void> updateResepById(String id, Map<String, dynamic> newData) async {
//     try {
//       await firestore.collection('resep').doc(id).update(newData);

//       int index = resepjson.indexWhere((element) => element['id'] == id,);
//       if (index != 1) {
//         resepjson[index] = {...resepjson[index], ...newData};
//         resepjson.refresh();
//       }
//     } catch (e) {}
//   }
// }
