import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/setting_page_controller.dart';

class SettingPageView extends GetView<SettingPageController> {
  const SettingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _buildHeader('Notifications Aktif Otomatis'),
              SizedBox(height: 20.h),
              _buildInfoCard(
                title: "Pengingat Sarapan",
                icon: Icons.wb_sunny,
                time: controller.sarapanTime,
              ),
              SizedBox(height: 15.h),
              _buildInfoCard(
                title: "Pengingat Makan Siang",
                icon: Icons.lunch_dining,
                time: controller.siangTime,
              ),
              SizedBox(height: 15.h),
              _buildInfoCard(
                title: "Pengingat Makan Malam",
                icon: Icons.dinner_dining,
                time: controller.malamTime,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Rx<TimeOfDay> time,
  }) {
    return Obx(() => Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: ListTile(
              leading: Icon(icon, color: Colors.blueAccent, size: 30.sp),
              title: Text(
                title,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                'Waktu: ${time.value.format(Get.context!)}',
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ),
        ));
  }
}
