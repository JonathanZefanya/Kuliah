// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_schedule_controller.dart';

class AddScheduleView extends GetView<AddScheduleController> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  final _formKey = GlobalKey<FormState>();

  AddScheduleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Jadwal Makan Obat'),
          backgroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Center(
              child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Tambah Jadwal',
                  style: TextStyle(
                      color: Color.fromARGB(255, 3, 155, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelText: 'Nama Obat Atau Judul',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kolom ini tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
                Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: TextFormField(
                  controller: controller.frequencyController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)),
                  labelText: 'Frekuensi (kali sehari)',
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (value) {
                  controller.frequency.value = int.parse(value);
                  },
                  validator: (value) {
                  if (value!.isEmpty) {
                    return 'Kolom ini tidak boleh kosong';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Hanya boleh diisi dengan angka';
                  }
                  if (int.parse(value) < 1) {
                    return 'Frekuensi tidak boleh kurang dari 1';
                  }
                  return null;
                  },
                ),
                ),
              Obx(
                () => Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.frequency.value,
                      itemBuilder: (context, index) {
                        final timeController = TextEditingController();
                        return Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: TextFormField(
                            controller: timeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Jam Makan Obat ke-${index + 1}',
                            ),
                            textInputAction: TextInputAction.next,
                            onTap: () {
                              displayTimePicker(context, timeController);
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Kolom ini tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    )),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 50, 213, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    child: const Text('Tambah'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.add(controller.nameController.text,
                            int.parse(controller.frequencyController.text));
                      }
                    },
                  )),
            ],
          )),
        ));
  }

  Future displayTimePicker(
      BuildContext context, TextEditingController textfieldController) async {
    var time = await showTimePicker(context: context, initialTime: timeOfDay);

    if (time != null) {
      textfieldController.text = "${time.hour}:${time.minute}";
      controller.timeController.add(textfieldController);
    }
  }
}
