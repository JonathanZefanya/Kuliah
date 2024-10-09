import 'package:get/get.dart';
import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/main_view.dart';
import 'app_routes.dart' as app_routes;

class AppPages {
  static final routes = [
    GetPage(
      name: app_routes.AppRoutes.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: app_routes.AppRoutes.register,
      page: () => RegisterView(),
    ),
    GetPage(
      name: app_routes.AppRoutes.home,
      page: () => const MainView(),
    ),
  ];
}
