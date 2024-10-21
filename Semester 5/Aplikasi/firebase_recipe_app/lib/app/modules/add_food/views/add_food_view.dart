import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/add_food_controller.dart';

class AddFoodView extends GetView<AddFoodController> {
  const AddFoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'NEW RECIPE',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        leading: const SizedBox(),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70.h,
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.r),
                    bottomRight: Radius.circular(20.r),
                  ),
                ),
                child: Text(
                  "Kamu Keren Sayang ❤\nMari Kita Mulai",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ).paddingSymmetric(horizontal: 20.w),
              ),
              Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.verticalSpace,
                    _buildLabel("Give your recipe a name"),
                    _buildTextField(controller.namaController, "Masukkan Nama Menu"),
                    30.verticalSpace,
                    _buildLabel("Let's see the final result"),
                    20.verticalSpace,
                    _buildImagePicker(context),
                    20.verticalSpace,
                    const Divider(),
                    20.verticalSpace,
                    _buildLabel("Jenis Resep"),
                    10.verticalSpace,
                    _buildDropdown(controller),
                    20.verticalSpace,
                    _buildLabel("Estimasi Waktu Memasak (menit)"),
                    _buildTextField(controller.waktuPembuatanController, "Masukkan Waktu Pembuatan", isNumber: true),
                    20.verticalSpace,
                    _buildLabel("Deskripsi"),
                    20.verticalSpace,
                    _buildTextField(controller.deskripsiController, "Masukkan Deskripsi", maxLines: 3),
                    20.verticalSpace,
                    _buildLabel("Resep, bahan dan langkah"),
                    20.verticalSpace,
                    _buildTextField(controller.resepController, "Masukkan Resep dan Cara Pembuatan", maxLines: 10),
                    30.verticalSpace,
                    _buildSubmitButton(controller),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText, {bool isNumber = false, int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildImagePicker(BuildContext context) {
    return Row(
      children: [
        controller.image.value.path != ""
            ? ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Image.file(
                  File(controller.image.value.path),
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.cover,
                ),
              )
            : GestureDetector(
                onTap: () async {
                  await controller.getImage(true);
                },
                child: Container(
                  height: 200.h,
                  width: 200.w,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Icon(Icons.add_a_photo, color: Colors.grey[700], size: 50.r),
                  ),
                ),
              ),
        controller.image.value.path != ""
            ? IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  controller.image.value = XFile("");
                },
              )
            : const SizedBox(),
      ],
    );
  }

  Widget _buildDropdown(AddFoodController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        alignment: Alignment.center,
        isExpanded: true,
        underline: const SizedBox(),
        iconSize: 30,
        dropdownColor: Colors.green,
        value: controller.selectedJenis.value,
        icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
        items: controller.selectJenis.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items, style: TextStyle(fontSize: 14.sp, color: Colors.white)),
          );
        }).toList(),
        onChanged: (String? newValue) {
          controller.selectedJenis.value = newValue.toString();
        },
      ),
    );
  }

  Widget _buildSubmitButton(AddFoodController controller) {
    return GestureDetector(
      onTap: () async {
        if (controller.namaController.text.isEmpty ||
            controller.waktuPembuatanController.text.isEmpty ||
            controller.deskripsiController.text.isEmpty ||
            controller.selectedJenis.value.isEmpty ||
            controller.image.value.path.isEmpty) {
          Get.snackbar('Error', 'Lengkapi data terlebih dahulu',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              borderRadius: 10,
              margin: const EdgeInsets.all(10),
              snackStyle: SnackStyle.FLOATING);
        } else {
          await controller.saveImages(
              File(controller.image.value.path),
              controller.namaController.text,
              int.parse(controller.waktuPembuatanController.text),
              controller.deskripsiController.text,
              controller.selectedJenis.value,
              controller.resepController.text);
          Get.back();
          Get.snackbar("Berhasil", "Menu berhasil ditambahkan.",
              backgroundColor: Colors.green,
              colorText: Colors.white);
        }
      },
      child: Container(
        width: double.infinity,
        height: 50.h,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: const Center(
          child: Text('Add Menu', style: TextStyle(color: Colors.white, fontSize: 16)),
        ),
      ),
    );
  }
}
