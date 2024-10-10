import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/schedule_controller.dart';
import '../../data/models/schedule_model.dart';
import '../../services/notification_service.dart';

class AddSchedulePage extends StatefulWidget {
  @override
  _AddSchedulePageState createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  
  final ScheduleController scheduleController = Get.find<ScheduleController>();

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  void _saveSchedule() {
    if (_formKey.currentState!.validate() && _selectedDate != null && _selectedTime != null) {
      // Format the selected date and time into strings for 'date' and 'time'
      String formattedDate = DateFormat('yyyy-MM-dd hh:mm:ss').format(_selectedDate!);
      String formattedTime = _selectedTime!.format(context);
      
      // Combine selected date and time into a full DateTime object
      final DateTime scheduledDate = DateTime(
        _selectedDate!.year,
        _selectedDate!.month,
        _selectedDate!.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );

      final newSchedule = Schedule(
        title: _titleController.text,
        description: _descriptionController.text,
        date: formattedDate, // Provide formatted date string
        time: formattedTime, // Provide formatted time string
        scheduledDate: scheduledDate, // Provide the DateTime object
      );

      // Add the schedule to the controller and set the notification
      scheduleController.addSchedule(newSchedule);
      if (newSchedule.id != null) {
        NotificationService().scheduleNotification(
          newSchedule.id!,
          newSchedule.title,
          newSchedule.description,
          scheduledDate,
        );
      }

      // Navigate back after saving
      Get.back();
    } else {
      // Buat snackbar jika form tidak valid dengan judul 'Error' berwarna merah dan pesan 'Please fill all fields and select date and time'
      Get.snackbar(
        'Error',
        'Please fill all fields and select date and time',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Schedule'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Select Date'
                        : DateFormat.yMd().format(_selectedDate!),
                  ),
                  ElevatedButton(
                    onPressed: _selectDate,
                    child: Text('Choose Date'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedTime == null
                        ? 'Select Time'
                        : _selectedTime!.format(context),
                  ),
                  ElevatedButton(
                    onPressed: _selectTime,
                    child: Text('Choose Time'),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _saveSchedule,
                child: Text('Save Schedule'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
