import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_recipes_controller.dart';

class AddRecipesView extends GetView<AddRecipesController> {
  const AddRecipesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddRecipesView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller.titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 2,
              ),
              TextField(
                controller: controller.ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                maxLines: 3,
              ),
              TextField(
                controller: controller.time_estimateController,
                decoration: const InputDecoration(labelText: 'Time Estimate'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: controller.intructionsController,
                decoration: const InputDecoration(labelText: 'Instructions'),
                maxLines: 3,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.addRecipe();
                },
                child: const Text('Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
