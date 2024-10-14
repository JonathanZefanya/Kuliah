import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:kelas_tambahan/main.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ice.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() => DraggableScrollableSheet(
              initialChildSize: controller.initialSize.value,
              maxChildSize: controller.maxSize.value,
              minChildSize: 0.1,
              builder: (context, ScrollController){
                return Container(
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: 50.w,
                          height: 5.h,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 20.h),
                        Text('Hello World', style: GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )            
                );
              },
            ),
          )
        ]
      )
    );
  }
}
