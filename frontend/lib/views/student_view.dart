import 'package:flutter/material.dart';
import 'package:frontend/controllers/student_controller.dart';
import 'package:get/get.dart';

class StudentView extends StatelessWidget {
  StudentView({super.key});

  final StudentController controller = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Students Record",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      DataTable(
                        dataTextStyle: const TextStyle(fontSize: 12),
                        headingTextStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        dividerThickness: 0,
                        border: TableBorder.all(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        headingRowHeight: 45,
                        showBottomBorder: true,
                        sortColumnIndex: 0,
                        columns: const [
                          DataColumn(label: Text("Id")),
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Roll")),
                          DataColumn(label: Text("City")),
                          DataColumn(label: Text("Edit")),
                          DataColumn(label: Text("Delete")),
                        ],
                        rows: controller.students
                            .map((student) => DataRow(
                                  cells: [
                                    DataCell(
                                      Center(child: Text(student.id.toString())),
                                    ),
                                    DataCell(Text(student.name)),
                                    DataCell(Text(student.roll.toString())),
                                    DataCell(Text(student.city)),
                                    const DataCell(
                                      Center(child: Icon(Icons.edit, size: 18)),
                                    ),
                                    const DataCell(
                                      Center(child: Icon(Icons.delete, size: 18)),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
