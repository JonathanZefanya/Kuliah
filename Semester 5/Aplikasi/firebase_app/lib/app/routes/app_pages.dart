import 'package:get/get.dart';

import '../modules/add_recipes/bindings/add_recipes_binding.dart';
import '../modules/add_recipes/views/add_recipes_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/recipe_detail/bindings/recipe_detail_binding.dart';
import '../modules/recipe_detail/views/recipe_detail_view.dart';
import '../modules/update_recipes/bindings/update_recipes_binding.dart';
import '../modules/update_recipes/views/update_recipes_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_RECIPES,
      page: () => const AddRecipesView(),
      binding: AddRecipesBinding(),
    ),
    GetPage(
      name: _Paths.RECIPE_DETAIL,
      page: () => const RecipeDetailView(),
      binding: RecipeDetailBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_RECIPES,
      page: () => const UpdateRecipesView(),
      binding: UpdateRecipesBinding(),
    ),
  ];
}
