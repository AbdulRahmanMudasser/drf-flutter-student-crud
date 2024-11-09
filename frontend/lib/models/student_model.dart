class StudentModel {
  final int? id;
  final String name;
  final int roll;
  final String city;

  StudentModel({
    this.id,
    required this.name,
    required this.roll,
    required this.city,
  });

  // From Json
  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      roll: json['roll'],
      city: json['city'],
    );
  }

  // To Json
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "roll": roll,
      "city": city,
    };
  }
}
