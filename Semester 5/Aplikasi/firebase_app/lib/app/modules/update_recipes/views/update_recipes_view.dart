import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/update_recipes_controller.dart';

class UpdateRecipesView extends GetView<UpdateRecipesController> {
  const UpdateRecipesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UpdateRecipesView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder(
              stream: controller.getRecipe(Get.arguments),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasData && snapshot.data.exists) {
                  // Ensure that snapshot has data and the document exists
                  final data = snapshot.data.data() as Map<String, dynamic>;
                  controller.titleController.text = data['title'];
                  controller.descriptionController.text = data['description'];
                  controller.ingredientsController.text = data['ingredients'];
                  controller.time_estimateController.text =
                      data['time_estimate'];
                  controller.intructionsController.text = data['instructions'];
                  return Column(
                    children: [
                      TextField(
                        controller: controller.titleController,
                        decoration: const InputDecoration(labelText: 'Title'),
                      ),
                      TextField(
                        controller: controller.descriptionController,
                        decoration:
                            const InputDecoration(labelText: 'Description'),
                        maxLines: 2,
                      ),
                      TextField(
                        controller: controller.ingredientsController,
                        decoration:
                            const InputDecoration(labelText: 'Ingredients'),
                        maxLines: 3,
                      ),
                      TextField(
                        controller: controller.time_estimateController,
                        decoration:
                            const InputDecoration(labelText: 'Time Estimate'),
                        keyboardType: TextInputType.number,
                      ),
                      TextField(
                        controller: controller.intructionsController,
                        decoration:
                            const InputDecoration(labelText: 'Instructions'),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          controller.updateRecipe(Get.arguments);
                        },
                        child: const Text('Update Recipe'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'No recipe available',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
