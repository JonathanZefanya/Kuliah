// ignore_for_file: invalid_use_of_protected_member

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/meal_category.dart';
import '../models/meal_item.dart';

class MealController extends GetxController {
  var categories = <MealCategory>[].obs;
  var meals = <MealItem>[].obs;
  var isLoading = true.obs;

  get filteredCategories => null;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    isLoading(true);
    try {
      // Fetch data from API
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
      );
      // Jika status code 200, maka data berhasil diambil
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['categories'] as List;
        categories.value = data.map((json) => MealCategory.fromJson(json)).toList();
      }
      // Jika gagal, tampilkan error
    } finally {
      isLoading(false);
    }
  }

  void fetchMealsByCategory(String category) async {
    isLoading(true);
    // Fetch data from API
    try {
      final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category'),
      );
      // Jika status code 200, maka data berhasil diambil
      if (response.statusCode == 200) {
        var data = json.decode(response.body)['meals'] as List;
        meals.value = data.map((json) => MealItem.fromJson(json)).toList();
      }
      // Jika gagal, tampilkan error
    } finally {
      isLoading(false);
    }
  }

   void searchMeal(String query) {
    if (query.isEmpty) {
      filteredCategories.value = categories;
    } else {
      filteredCategories.value = categories
          .where((category) => category.strCategory!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}