import 'package:get/get.dart';
import '../data/db/db_helper.dart';
import '../data/models/schedule_model.dart';
import '../services/notification_service.dart';

class ScheduleController extends GetxController {
  var schedules = <Schedule>[].obs;
  final dbHelper = DatabaseHelper();
  final notificationService = NotificationService();

  @override
  void onInit() {
    super.onInit();
    loadSchedules();
  }

  void loadSchedules() async {
    final data = await dbHelper.queryAllSchedules();
    schedules.value = data.map((item) => Schedule.fromMap(item)).toList();
  }

  void addSchedule(Schedule schedule) async {
    await dbHelper.insertSchedule(schedule.toMap());
    final DateTime scheduleTime = DateTime.parse(
        "${schedule.date} ${schedule.time}"); // Menggunakan date + time
    await notificationService.scheduleNotification(
      schedule.id!,
      schedule.title,
      'It\'s time for ${schedule.title}',
      scheduleTime,
    );
    loadSchedules();
  }

  void deleteSchedule(int id) async {
    await dbHelper.deleteSchedule(id);
    await notificationService.cancelNotification(id);
    loadSchedules();
  }
}
