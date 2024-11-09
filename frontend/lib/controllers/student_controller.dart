import 'package:frontend/services/student_service.dart';
import 'package:get/get.dart';

import '../models/student_model.dart';

class StudentController extends GetxController {
  var students = <StudentModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchStudent();
    super.onInit();
  }

  // Fetch Student
  void fetchStudent() async {
    try {
      isLoading(true);

      var studentsList = await StudentService.getStudents();

      students.assignAll(studentsList);
    } finally {
      isLoading(false);
    }
  }

  // Create Student
  void createStudent(String name, int roll, String city) async {
    var newStudent = await StudentService.createStudent(name, roll, city);

    if (newStudent != null) {
      students.add(newStudent);
    }
  }

  // Delete Student
  void deleteStudent(int id) async {
    bool success = await StudentService.deleteStudent(id);

    if (success) {
      students.removeWhere((student) => student.id == id);
    }
  }
}
