import 'package:flutter/material.dart';
import 'package:frontend/controllers/student_controller.dart';
import 'package:get/get.dart';

void createStudentDialog(BuildContext context, StudentController controller) {
  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final cityController = TextEditingController();

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              controller: rollController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Roll",
                labelStyle: TextStyle(fontSize: 14),
              ),
            ),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                labelText: "City",
                labelStyle: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              controller.createStudent(
                nameController.text,
                int.parse(rollController.text),
                cityController.text,
              );
              Get.back();
            },
            child: const Text("Add"),
          ),
        ],
      );
    },
  );
}
