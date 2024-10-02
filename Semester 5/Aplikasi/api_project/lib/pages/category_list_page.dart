// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../services/api_service.dart';
import 'meal_list_page.dart';

class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  _CategoryListPageState createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  final ApiService apiService = ApiService();
  final TextEditingController searchController = TextEditingController();
  RxList<dynamic> categories = <dynamic>[].obs; // List for categories
  RxList<dynamic> filteredCategories = <dynamic>[].obs; // List for search results
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories at the start
  }

  void fetchCategories() async {
    try {
      isLoading(true);
      final data = await apiService.fetchCategories();
      categories.value = data;
      filteredCategories.value = data; // Set default filtered categories
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  void filterSearch(String query) {
    if (query.isEmpty) {
      filteredCategories.value = categories;
    } else {
      filteredCategories.value = categories
          .where((category) => category['strCategory']
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Meal From API'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  filterSearch(value);
                },
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search category...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              child: filteredCategories.isEmpty
                  ? const Center(child: Text('No categories found'))
                  : ListView.builder(
                      itemCount: filteredCategories.length,
                      itemBuilder: (context, index) {
                        final category = filteredCategories[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                category['strCategoryThumb'],
                                fit: BoxFit.cover,
                                width: 60,
                                height: 60,
                              ),
                            ),
                            title: Text(
                              category['strCategory'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              category['strCategoryDescription'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            onTap: () {
                              Get.to(MealListPage(category: category['strCategory']));
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      }),
    );
  }
}
