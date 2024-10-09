import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String categoryUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final String mealByCategoryUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=';

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> fetchMealsByCategory(String category) async {
    final response = await http.get(Uri.parse('$mealByCategoryUrl$category'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}