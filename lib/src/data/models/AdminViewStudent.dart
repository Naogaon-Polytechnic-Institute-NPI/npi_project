import 'dart:convert';

class AdminViewStudent {
  String? response;
  int? studentsFound;
  List<Student>? students;

  AdminViewStudent({
    this.response,
    this.studentsFound,
    this.students,
  });

  factory AdminViewStudent.fromRawJson(String str) => AdminViewStudent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AdminViewStudent.fromJson(Map<String, dynamic> json) => AdminViewStudent(
    response: json["response"],
    studentsFound: json["studentsFound"],
    students: json["Students"] == null ? [] : List<Student>.from(json["Students"]!.map((x) => Student.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "studentsFound": studentsFound,
    "Students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
  };
}

class Student {
  String? privateId;
  String? name;
  String? roll;
  String? registration;
  String? technology;
  String? session;
  String? dateCreated;

  Student({
    this.privateId,
    this.name,
    this.roll,
    this.registration,
    this.technology,
    this.session,
    this.dateCreated,
  });

  factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    privateId: json["private_id"],
    name: json["name"],
    roll: json["roll"],
    registration: json["registration"],
    technology: json["technology"],
    session: json["session"],
    dateCreated: json["date_created"],
  );

  Map<String, dynamic> toJson() => {
    "private_id": privateId,
    "name": name,
    "roll": roll,
    "registration": registration,
    "technology": technology,
    "session": session,
    "date_created": dateCreated,
  };
}
