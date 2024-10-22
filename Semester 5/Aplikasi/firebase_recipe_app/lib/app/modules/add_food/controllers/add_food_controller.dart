import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddFoodController extends GetxController {
  final image =
      XFile("").obs; //digunakan untuk menampung file gambar dari resep.

  CollectionReference ref = FirebaseFirestore.instance.collection('Food');

  TextEditingController namaController = TextEditingController();
  TextEditingController waktuPembuatanController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController resepController = TextEditingController();

  final selectJenis = [
    "Makanan",
    "Minuman",
    "Kuah",
  ];

//variable untuk menampung filter yang dipilih
  final selectedJenis = "Makanan".obs;
  Future getImage(bool gallery) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    if (gallery) {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    }
    //jika user memilih sebuah gambar maka pickedfile di assign kedalam image variable
    if (pickedFile != null) {
      image.value = pickedFile;
    }
  }

  @override
  void onClose() {
    namaController.dispose();
    waktuPembuatanController.dispose();
    deskripsiController.dispose();
    resepController.dispose();
    super.onClose();
  }

  Future<String> uploadFile(File image) async {
    final storageReference =
        FirebaseStorage.instance.ref().child('Menus/${image.path}');
    await storageReference.putFile(image);
    String returnURL = "";
    await storageReference.getDownloadURL().then(
      (fileURL) {
        returnURL = fileURL;
      },
    );
    return returnURL;
  }

  Future<void> saveImages(
    File images,
    String nama,
    int waktuPembuatan,
    String deskripsi,
    String jenis,
    String resep,
  ) async {
    //tampilkan loading indicator
    Get.bottomSheet(
      Container(
          height: 80,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(),
              Text("Loading"),
            ],
          )),
    );
    //upload file ke cloud_storage dan simpan pada imageURL
    String imageURL = await uploadFile(images);
    final refDoc = ref.doc();
    final data = {
      "id": refDoc.id,
      "nama": nama,
      "deskripsi": deskripsi,
      "waktu_pembuatan": waktuPembuatan,
      "jenis": jenis,
      "resep": resep,
      "images": imageURL
    };
    refDoc.set(data);
    Get.back();
  }
}
