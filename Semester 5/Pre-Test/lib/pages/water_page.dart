import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretest/controllers/water_controllers.dart';
import 'package:pretest/pages/ice_scream_page.dart';

class WaterBalancePage extends StatelessWidget {
  final WaterController controller = Get.put(WaterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Water Balance'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Water Balance',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TabBarWidget(), // Add the tab bar (Today, 7 Days, etc.)
            SizedBox(height: 20),
            Obx(() => Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Kotak hitam sebagai background
                    Container(
                      height: 200,
                      width: 120,
                      color: Colors.black,
                    ),
                    // Air dengan animasi yang mengisi kotak hitam
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 200 * controller.progress, // Ketinggian air berdasarkan progres
                      width: 120,
                      color: const Color.fromARGB(255, 28, 126, 255), // Ganti dengan warna air sesuai selera
                    ),
                    // Text Persentase air dan ml di dalam kotak
                    Container(
                      height: 200,
                      width: 120,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${(controller.progress * 100).toInt()}%',
                              style: TextStyle(color: Colors.white, fontSize: 32),
                            ),
                            Text(
                              '${controller.currentMl} ml',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: controller.decrement,
                      icon: Icon(Icons.remove_circle_outline),
                      iconSize: 32,
                    ),
                    Text(
                      '${controller.waterConsumed}',
                      style: TextStyle(fontSize: 32),
                    ),
                    IconButton(
                      onPressed: controller.increment,
                      icon: Icon(Icons.add_circle_outline),
                      iconSize: 32,
                    ),
                  ],
                ),
                Text('of 8 glasses (2000ml)'),
              ],
            )),
            Spacer(),
            ElevatedButton(
              onPressed: () => Get.to(() => IceCreamPage()),
              child: Text('Next Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        tabs: [
          Tab(text: 'Today'),
          Tab(text: '7 Days'),
          Tab(text: '30 Days'),
          Tab(text: '3 Months'),
        ],
      ),
    );
  }
}
