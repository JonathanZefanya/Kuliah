import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/setting_page_controller.dart';

class SettingPageView extends GetView<SettingPageController> {
  const SettingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil to enable responsive scaling based on screen size
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h), // Responsive vertical spacing
              _buildHeader('Notifications'),
              SizedBox(height: 20.h),
              _buildToggleCard(
                title: "Pengingat Sarapan",
                icon: Icons.wb_sunny,
                toggleValue: controller.sarapanToggle,
                time: controller.sarapanTime,
                onTimeSelect: () => controller.pickTime('sarapan'),
                onChanged: (value) => controller.toggleSarapan(),
              ),
              SizedBox(height: 15.h), // Add spacing between cards
              _buildToggleCard(
                title: "Pengingat Makan Siang",
                icon: Icons.lunch_dining,
                toggleValue: controller.siangToggle,
                time: controller.siangTime,
                onTimeSelect: () => controller.pickTime('siang'),
                onChanged: (value) => controller.toggleSiang(),
              ),
              SizedBox(height: 15.h),
              _buildToggleCard(
                title: "Pengingat Makan Malam",
                icon: Icons.dinner_dining,
                toggleValue: controller.malamToggle,
                time: controller.malamTime,
                onTimeSelect: () => controller.pickTime('malam'),
                onChanged: (value) => controller.toggleMalam(),
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
      style: TextStyle(
        fontSize: 18.sp, // Responsive font size
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildToggleCard({
    required String title,
    required IconData icon,
    required RxBool toggleValue,
    required Rx<TimeOfDay> time,
    required VoidCallback onTimeSelect,
    required ValueChanged<bool> onChanged,
  }) {
    return Obx(() => GestureDetector(
          onTap: onTimeSelect,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.r), // Responsive border radius
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h), // Responsive padding inside card
              child: ListTile(
                leading: Icon(
                  icon,
                  color: Colors.blueAccent,
                  size: 30.sp, // Responsive icon size
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp, // Responsive font size
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h), // Spacing between title and time
                    Text(
                      'Waktu: ${time.value.format(Get.context!)}',
                      style: TextStyle(fontSize: 14.sp), // Responsive text size for time
                    ),
                    SizedBox(height: 5.h), // Spacing between time and button
                    TextButton(
                      onPressed: onTimeSelect,
                      child: Text(
                        'Ubah Waktu',
                        style: TextStyle(fontSize: 14.sp), // Responsive button text size
                      ),
                    ),
                  ],
                ),
                trailing: Switch(
                  value: toggleValue.value,
                  onChanged: onChanged,
                  activeColor: Colors.green,
                ),
              ),
            ),
          ),
        ));
  }
}
