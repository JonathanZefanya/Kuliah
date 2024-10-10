import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/schedule_controller.dart';
import 'add_schedule_page.dart';

class SchedulePage extends StatelessWidget {
  final ScheduleController controller = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule List'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
      body: Obx(() {
        if (controller.schedules.isEmpty) {
          return Center(child: Text('No schedules yet.'));
        }
        return ListView.builder(
          itemCount: controller.schedules.length,
          itemBuilder: (context, index) {
            final schedule = controller.schedules[index];
            return Card(
              child: ListTile(
                title: Text(schedule.title),
                subtitle: Text('${schedule.date} - ${schedule.time}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteSchedule(schedule.id!);
                  },
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddSchedulePage());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}