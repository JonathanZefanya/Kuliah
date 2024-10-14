import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = const Size(414, 895);
    return ScreenUtilInit(
      designSize: screenSize,
      builder: (_, __) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "CatchupClass",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        
      ),
    );
  }
}