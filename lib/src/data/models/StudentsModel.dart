import 'dart:convert';
StudentsModel studentsModelFromJson(String str) => StudentsModel.fromJson(json.decode(str));
String studentsModelToJson(StudentsModel data) => json.encode(data.toJson());
class StudentsModel {
  StudentsModel({
      String? response, 
      int? studentsFound, 
      List<Students>? students,}){
    _response = response;
    _studentsFound = studentsFound;
    _students = students;
}

  StudentsModel.fromJson(dynamic json) {
    _response = json['response'];
    _studentsFound = json['studentsFound'];
    if (json['students'] != null) {
      _students = [];
      json['students'].forEach((v) {
        _students?.add(Students.fromJson(v));
      });
    }
  }
  String? _response;
  int? _studentsFound;
  List<Students>? _students;
StudentsModel copyWith({  String? response,
  int? studentsFound,
  List<Students>? students,
}) => StudentsModel(  response: response ?? _response,
  studentsFound: studentsFound ?? _studentsFound,
  students: students ?? _students,
);
  String? get response => _response;
  int? get studentsFound => _studentsFound;
  List<Students>? get students => _students;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['studentsFound'] = _studentsFound;
    if (_students != null) {
      map['students'] = _students?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Students studentsFromJson(String str) => Students.fromJson(json.decode(str));
String studentsToJson(Students data) => json.encode(data.toJson());
class Students {
  Students({
      String? privateId, 
      String? name, 
      String? roll, 
      String? registration, 
      String? technology, 
      String? shift, 
      String? session, 
      String? dateCreated,}){
    _privateId = privateId;
    _name = name;
    _roll = roll;
    _registration = registration;
    _technology = technology;
    _shift = shift;
    _session = session;
    _dateCreated = dateCreated;
}

  Students.fromJson(dynamic json) {
    _privateId = json['private_id'];
    _name = json['name'];
    _roll = json['roll'];
    _registration = json['registration'];
    _technology = json['technology'];
    _shift = json['shift'];
    _session = json['session'];
    _dateCreated = json['date_created'];
  }
  String? _privateId;
  String? _name;
  String? _roll;
  String? _registration;
  String? _technology;
  String? _shift;
  String? _session;
  String? _dateCreated;
Students copyWith({  String? privateId,
  String? name,
  String? roll,
  String? registration,
  String? technology,
  String? shift,
  String? session,
  String? dateCreated,
}) => Students(  privateId: privateId ?? _privateId,
  name: name ?? _name,
  roll: roll ?? _roll,
  registration: registration ?? _registration,
  technology: technology ?? _technology,
  shift: shift ?? _shift,
  session: session ?? _session,
  dateCreated: dateCreated ?? _dateCreated,
);
  String? get privateId => _privateId;
  String? get name => _name;
  String? get roll => _roll;
  String? get registration => _registration;
  String? get technology => _technology;
  String? get shift => _shift;
  String? get session => _session;
  String? get dateCreated => _dateCreated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['private_id'] = _privateId;
    map['name'] = _name;
    map['roll'] = _roll;
    map['registration'] = _registration;
    map['technology'] = _technology;
    map['shift'] = _shift;
    map['session'] = _session;
    map['date_created'] = _dateCreated;
    return map;
  }

}