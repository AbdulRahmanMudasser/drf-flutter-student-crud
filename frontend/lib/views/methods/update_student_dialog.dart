import 'package:flutter/material.dart';
import 'package:frontend/controllers/student_controller.dart';
import 'package:frontend/models/student_model.dart';
import 'package:get/get.dart';

void updateStudentDialog(BuildContext context, StudentController controller, StudentModel student) {
  final nameController = TextEditingController(text: student.name);
  final rollController = TextEditingController(text: student.roll.toString());
  final cityController = TextEditingController(text: student.city);

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
              controller.updateStudent(
                student.id!,
                nameController.text,
                int.parse(rollController.text),
                cityController.text,
              );
              Get.back();
            },
            child: const Text("Update"),
          ),
        ],
      );
    },
  );
}
