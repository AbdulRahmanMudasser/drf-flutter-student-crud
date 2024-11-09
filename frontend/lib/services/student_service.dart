import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/models/student_model.dart';

class StudentService {
  static const String baseURL = "http://192.168.182.179:8000/";

  // Fetch All Students
  static Future<List<StudentModel>> getStudents() async {
    final response = await http.get(Uri.parse("${baseURL}students/"));

    if (response.statusCode == 200) {
      List jsonResponses = json.decode(response.body);

      return jsonResponses.map((student) => StudentModel.fromJson(student)).toList();
    } else {
      throw Exception("Failed to Load Students");
    }
  }
}
