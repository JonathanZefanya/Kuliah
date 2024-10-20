import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myobat/app/data/medicine.dart';
import 'package:myobat/app/data/notification.dart' as notif;
import 'package:myobat/app/utils/notification_api.dart';
import '../controllers/detail_medicine_controller.dart';

class DetailMedicineView extends GetView<DetailMedicineController> {
  const DetailMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Konsumsi Obat'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            FutureBuilder<Medicine>(
              future: controller.getMedicineData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      title: Text(
                        snapshot.data!.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${snapshot.data!.frequency.toString()} kali sehari",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<notif.Notification>>(
              future: controller.getNotificationData(Get.arguments),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.notifications, color: Colors.indigo),
                            title: Text(snapshot.data![index].time),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 1, 198, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Aku Sudah Minum Obat Ini Hari Ini',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  controller.deleteMedicine(Get.arguments);
                  NotificationApi.showNotification(
                    id: 99, // A unique ID for this notification
                    title: 'Kamu Hebat!',
                    body: 'Terima kasih sudah minum obat tepat waktu.',
                    payload: 'Congrats notification',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}