// import 'dart:convert';
//
// class AdminView {
//   String? response;
//   int? studentsFound;
//   List<Student>? students;
//
//   AdminView({
//     this.response,
//     this.studentsFound,
//     this.students,
//   });
//
//   factory AdminView.fromRawJson(String str) => AdminView.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   // factory AdminView.fromJson(Map<String, dynamic> json) => AdminView(
//   //   response: json["response"],
//   //   studentsFound: json["studentsFound"],
//   //   students: List<Student>.from(json["Students"]?.map((x) => Student.fromJson(x)) ?? []),
//   // );
//   // factory AdminView.fromJson(Map<String, dynamic> json) => AdminView(
//   //   response: json["response"],
//   //   studentsFound: json["studentsFound"],
//   //   students: json["students"] == null
//   //       ? []
//   //       : List<Student>.from(json["students"].map((x) => Student.fromJson(x))),
//   // );
//
//   factory AdminView.fromJson(Map<String, dynamic> json) => AdminView(
//     response: json["response"],
//     studentsFound: json["studentsFound"],
//     students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "response": response,
//     "studentsFound": studentsFound,
//     "Students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
//   };
//
//   @override
//   String toString() {
//     return 'AdminView(response: $response, studentsFound: $studentsFound, students: $students)';
//   }
// }
//
// class Student {
//   String? privateId;
//   String? name;
//   String? roll;
//   String? registration;
//   String? technology;
//   String? session;
//   String? dateCreated;
//
//   Student({
//     this.privateId,
//     this.name,
//     this.roll,
//     this.registration,
//     this.technology,
//     this.session,
//     this.dateCreated,
//   });
//
//   factory Student.fromRawJson(String str) => Student.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Student.fromJson(Map<String, dynamic> json) {
//     return Student(
//       privateId: json['private_id'] ?? '',
//       name: json['name'] ?? '',
//       roll: json['roll'] ?? '',
//       registration: json['registration'] ?? '',
//       technology: json['technology'] ?? '',
//       session: json['session'] ?? '',
//       dateCreated: json['date_created'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "private_id": privateId,
//     "name": name,
//     "roll": roll,
//     "registration": registration,
//     "technology": technology,
//     "session": session,
//     "date_created": dateCreated,
//   };
//
//
// }
//
//
// // class AdminView {
// //   String response;
// //   int studentsFound;
// //   List<Student> students;
// //
// //   AdminView({
// //     required this.response,
// //     required this.studentsFound,
// //     required this.students,
// //   });
// //
// //   factory AdminView.fromJson(Map<String, dynamic> json) {
// //     return AdminView(
// //       response: json['response'] ?? '',
// //       studentsFound: json['studentsFound'] ?? 0,
// //       students: (json['students'] as List<dynamic>?)
// //           ?.map((studentJson) => Student.fromJson(studentJson))
// //           .toList() ?? [],
// //     );
// //   }
// // }
// //
// // class Student {
// //   String privateId;
// //   String name;
// //   String roll;
// //
// //   Student({
// //     required this.privateId,
// //     required this.name,
// //     required this.roll,
// //   });
// //
// //   factory Student.fromJson(Map<String, dynamic> json) {
// //     return Student(
// //       privateId: json['private_id'] ?? '',
// //       name: json['name'] ?? '',
// //       roll: json['roll'] ?? '',
// //     );
// //   }
// // }


class AdminView {
  final String response;
  final int studentsFound;
  final List<Student> students;

  AdminView({
    required this.response,
    required this.studentsFound,
    required this.students,
  });

  factory AdminView.fromJson(Map<String, dynamic> json) {
    return AdminView(
      response: json['response'] ?? '',
      studentsFound: json['studentsFound'] ?? 0,
      students: (json['students'] as List<dynamic>?)
          ?.map((studentJson) => Student.fromJson(studentJson))
          .toList() ??
          [],
    );
  }
}

class Student {
  final String privateId;
  final String name;
  final String roll;
  final String registration;
  final String technology;
  final String session;
  final String dateCreated;

  Student({
    required this.privateId,
    required this.name,
    required this.roll,
    required this.registration,
    required this.technology,
    required this.session,
    required this.dateCreated,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      privateId: json['private_id'] ?? '',
      name: json['name'] ?? '',
      roll: json['roll'] ?? '',
      registration: json['registration'] ?? '',
      technology: json['technology'] ?? '',
      session: json['session'] ?? '',
      dateCreated: json['date_created'] ?? '',
    );
  }
}