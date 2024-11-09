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

  void fetchStudent() async {
    try {
      isLoading(true);

      var studentsList = await StudentService.getStudents();

      students.assignAll(studentsList);
    } finally {
      isLoading(false);
    }
  }
}
