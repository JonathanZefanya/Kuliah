import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:apps/app/modules/home/controllers/home_controller.dart';
import 'package:apps/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            onPressed: controller.logout,
            icon: const Icon(Icons.logout),
            color: Colors.white,
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              var data = snapshot.data!.docs;
              return ListView.builder(
                padding: EdgeInsets.all(10),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var resep = data[index].data() as Map<String, dynamic>?;
                  if (resep != null) {
                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: () => Get.toNamed(Routes.UPDATE, arguments: data[index].id),
                        title: Text(resep?['title'] ?? 'No Title', style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(resep?['time_estimation'] ?? 'No Description'),
                        trailing: IconButton(
                          onPressed: () => controller.deleteData(data[index].id),
                          icon: Icon(Icons.delete, color: Colors.redAccent),
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
                child: Text('No data available', style: TextStyle(fontSize: 18)),
              );
            }
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('An error occurred while loading data', style: TextStyle(fontSize: 18)),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}
