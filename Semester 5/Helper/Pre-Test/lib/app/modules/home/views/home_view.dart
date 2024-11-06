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
        title: Obx(
          () => Text(
            'Hello, ${controller.username}!',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: Icon(Icons.notifications_none, color: Colors.black87),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
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
                    int moodIndex =
                        post['mood'] ?? 1; // Nilai mood default netral (1)

                    // Define three colors for each mood
                    List<List<Color>> moodColors = [
                      [
                        Colors.red.shade100.withOpacity(0.5),
                        Colors.red.shade200.withOpacity(0.5),
                        Colors.red.shade300.withOpacity(0.5),
                      ], // Sedih
                      [
                        Colors.green.shade100.withOpacity(0.5),
                        Colors.green.shade200.withOpacity(0.5),
                        Colors.green.shade300.withOpacity(0.5),
                      ], // Netral
                      [
                        Colors.yellow.shade100.withOpacity(0.5),
                        Colors.yellow.shade200.withOpacity(0.5),
                        Colors.yellow.shade300.withOpacity(0.5),
                      ], // Senang
                    ];

                    // Define corresponding emojis
                    List<String> emojis = ["😢", "😐", "😊"];

                    // Ensure moodIndex is within bounds
                    moodIndex = moodIndex.clamp(0, 2);

                    // Choose a color based on moodIndex
                    Color cardColor = moodColors[moodIndex][moodIndex % 3];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        color: cardColor,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    emojis[moodIndex],
                                    style: TextStyle(fontSize: 28), // Ukuran emoji lebih besar
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    '@${post['username']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {
                                      Get.toNamed('/update', arguments: {
                                        'docID': docID,
                                        'title': post['title'],
                                        'description': post['description'],
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Get.toNamed('/create'), // Navigasi ke halaman CreateView
        backgroundColor: Colors.grey[600],
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
