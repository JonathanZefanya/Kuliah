import 'package:get/get.dart';

import '../controllers/add_recipes_controller.dart';

class AddRecipesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddRecipesController>(
      () => AddRecipesController(),
    );
  }
}
