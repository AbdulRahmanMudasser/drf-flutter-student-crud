import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:frontend/models/student_model.dart';

class StudentService {
  static const String baseURL = "http://192.168.182.179:8000";

  // Fetch All Students
  static Future<List<StudentModel>> getStudents() async {
    final response = await http.get(Uri.parse("$baseURL/students/"));

    if (response.statusCode == 200) {
      List jsonResponses = json.decode(response.body);

      return jsonResponses.map((student) => StudentModel.fromJson(student)).toList();
    } else {
      throw Exception("Failed to Load Students");
    }
  }

  // Create Student
  static Future<StudentModel?> createStudent(String name, int roll, String city) async {
    final response = await http.post(
      Uri.parse("$baseURL/student/create/"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": name,
        "roll": roll,
        "city": city,
      }),
    );

    if (response.statusCode == 201) {
      return StudentModel.fromJson(json.decode(response.body));
    } else {
      return null;
    }
  }

  // Delete Student
  static Future<bool> deleteStudent(int id) async {
    final response = await http.delete(Uri.parse("$baseURL/student/delete/$id/"));

    return response.statusCode == 200;
  }
}
