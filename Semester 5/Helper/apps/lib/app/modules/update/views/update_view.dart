import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreateView'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data!;
              controller.titleController.text = data['title'];
              controller.timeestimationController.text = data['time_estimation'];
              controller.instructionsController.text = data['instructions'];
              controller.ingredientnsController.text = data['ingredients'];
              return Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: const Text(
                        'Add Post Page',
                        style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: controller.titleController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Title',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: TextField(
                        controller: controller.timeestimationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Time Estimation',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: TextField(
                        controller: controller.instructionsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Instructions',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: TextField(
                        controller: controller.ingredientnsController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'Ingredients',
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.indigo,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          child: const Text('Save Changes'),
                          onPressed: () {
                            controller.updateData(
                                Get.arguments,
                                controller.titleController.text,
                                controller.timeestimationController.text,
                                controller.instructionsController.text,
                                controller.ingredientnsController.text,);
                          },
                        )),
                  ],
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
