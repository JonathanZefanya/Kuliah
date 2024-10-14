import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('HomeView'),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: controller.getRecipes(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData && snapshot.data.docs.isEmpty) {
              // If snapshot has data but it's empty, display a centered text
              return const Center(
                child: Text(
                  'No recipes available',
                  style: TextStyle(fontSize: 16),
                ),
              );
            } else if (snapshot.hasError) {
              // If snapshot has error, display error message
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(fontSize: 16),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data.docs[index]['title']),
                    subtitle: Text(snapshot.data.docs[index]['description']),
                    onTap: () {
                      final docId = snapshot.data.docs[index].id;
                      print("Reference id : $docId");
                      Get.toNamed(Routes.RECIPE_DETAIL, arguments: docId);
                    },
                    onLongPress: () {
                      //make a button to update or delete the recipe
                      Get.defaultDialog(
                        title: 'Update or Delete',
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Recipe: ${snapshot.data.docs[index]['title']}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    final docId = snapshot.data.docs[index].id;
                                    print("Reference id : $docId");
                                    Get.back();
                                    Get.toNamed(Routes.UPDATE_RECIPES,
                                        arguments: docId);
                                  },
                                  child: const Text('Update'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                    controller.deleteRecipe(
                                        snapshot.data.docs[index].id);
                                  },
                                  child: const Text('Delete'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADD_RECIPES);
          },
          child: const Icon(Icons.add),
        ));
  }
}
