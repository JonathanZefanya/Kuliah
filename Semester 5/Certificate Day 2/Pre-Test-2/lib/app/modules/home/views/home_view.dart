import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_application/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Obx(() => Text(
              //   'Hello, ${controller.username}!',
              //   style: TextStyle(
              //     color: Colors.black87,
              //     fontSize: 22,
              //     fontWeight: FontWeight.w500,
              //   ),
              // )),
              // SizedBox(height: 10),
              TextField(
                onChanged: (query) {
                  controller.searchQuery.value = query;
                },
                decoration: InputDecoration(
                  hintText: 'Search posts...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: Icon(Icons.notifications_none, color: Colors.black87),
          ),
        ],
      ),
      body: Obx(() {
        var stream = controller.searchQuery.value.isEmpty
            ? controller.streamData()
            : controller.streamFilteredData(controller.searchQuery.value);

        return StreamBuilder<QuerySnapshot<Object?>>(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                var data = snapshot.data!.docs;
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var post = data[index].data() as Map<String, dynamic>?;
                    var docID = data[index].id;
                    if (post != null) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '@${post['user']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  post['title'] ?? 'No Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  post['description'] ?? 'No Description',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 10),
                                post['photoUrl'] != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Image.network(
                                          post['photoUrl'],
                                          width: double.infinity,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon:
                                          Icon(Icons.edit, color: Colors.blue),
                                      onPressed: () {
                                        if (controller.username.value ==
                                            post['user']) {
                                          Get.toNamed('/update', arguments: {
                                            'docID': docID,
                                            'title': post['title'],
                                            'description': post['description'],
                                          });
                                        } else {
                                          Get.defaultDialog(
                                            title: 'Permission Denied',
                                            middleText:
                                                'You are not the owner of this post.',
                                            textConfirm: 'OK',
                                            onConfirm: () => Get.back(),
                                          );
                                        }
                                      },
                                    ),
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () {
                                        controller.deleteData(docID);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return const ListTile(title: Text('Invalid post data'));
                    }
                  },
                );
              } else {
                return const Center(
                  child:
                      Text('No data available', style: TextStyle(fontSize: 18)),
                );
              }
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('An error occurred while loading data',
                    style: TextStyle(fontSize: 18)),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/create'),
        backgroundColor: Colors.grey[600],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
