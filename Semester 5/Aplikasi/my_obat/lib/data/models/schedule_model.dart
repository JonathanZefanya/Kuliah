import 'package:intl/intl.dart';

class Schedule {
  final int? id;
  final String title;
  final String description;
  final String date;
  final String time;
  final DateTime scheduledDate;

  Schedule({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.scheduledDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'time': time,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    // Parse date and time using DateFormat to get DateTime object
    final parsedDate = DateFormat('yyyy-MM-dd hh:mm:ss').parse(map['date']);
    final parsedTime = DateFormat.jm().parse(map['time']); // Time in AM/PM format

    // Combine date and time into a DateTime object
    final scheduledDate = DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );

    return Schedule(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      time: map['time'],
      scheduledDate: scheduledDate,
    );
  }
}
