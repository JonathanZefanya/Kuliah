import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String categoryUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  final String filterUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=';

  Future<List<dynamic>> fetchCategories() async {
    final response = await http.get(Uri.parse(categoryUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body)['categories'];
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<dynamic>> fetchMealsByCategory(String category) async {
    final response = await http.get(Uri.parse('$filterUrl$category'));
    if (response.statusCode == 200) {
      return json.decode(response.body)['meals'];
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
