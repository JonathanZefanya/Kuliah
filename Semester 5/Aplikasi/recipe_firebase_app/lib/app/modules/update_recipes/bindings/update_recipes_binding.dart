import 'package:get/get.dart';

import '../controllers/update_recipes_controller.dart';

class UpdateRecipesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateRecipesController>(
      () => UpdateRecipesController(),
    );
  }
}
