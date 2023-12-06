/// response : "success"
/// totalStudentFound : 2
/// Students : [{"private_id":"32f23101-52c8-4b3a-9c2d-ff6b1886f145","name":"Md Shadikul Islam Shafi","roll":"114097","registration":"1500915182","technology":"CMT","session":"18-19","date_created":"Sat, 02 Dec 2023 06:52:12 GMT"},{"private_id":"b305f1b3-638e-404d-b09c-de30002e17b5","name":"Md Shadikul Islam Shafi","roll":"114099","registration":"1500915182","technology":"CMT","session":"18-19","date_created":"Sat, 02 Dec 2023 09:15:00 GMT"}]

class AdminViewStudent {
  AdminViewStudent({
      String? response, 
      int? totalStudentFound, 
      List<Students>? students,}){
    _response = response;
    _totalStudentFound = totalStudentFound;
    _students = students;
}

  AdminViewStudent.fromJson(dynamic json) {
    _response = json['response'];
    _totalStudentFound = json['totalStudentFound'];
    if (json['Students'] != null) {
      _students = [];
      json['Students'].forEach((v) {
        _students?.add(Students.fromJson(v));
      });
    }
  }
  String? _response;
  int? _totalStudentFound;
  List<Students>? _students;

  String? get response => _response;
  int? get totalStudentFound => _totalStudentFound;
  List<Students>? get students => _students;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    map['totalStudentFound'] = _totalStudentFound;
    if (_students != null) {
      map['Students'] = _students?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// private_id : "32f23101-52c8-4b3a-9c2d-ff6b1886f145"
/// name : "Md Shadikul Islam Shafi"
/// roll : "114097"
/// registration : "1500915182"
/// technology : "CMT"
/// session : "18-19"
/// date_created : "Sat, 02 Dec 2023 06:52:12 GMT"

class Students {
  Students({
      String? privateId, 
      String? name, 
      String? roll, 
      String? registration, 
      String? technology, 
      String? session, 
      String? dateCreated,}){
    _privateId = privateId;
    _name = name;
    _roll = roll;
    _registration = registration;
    _technology = technology;
    _session = session;
    _dateCreated = dateCreated;
}

  Students.fromJson(dynamic json) {
    _privateId = json['private_id'];
    _name = json['name'];
    _roll = json['roll'];
    _registration = json['registration'];
    _technology = json['technology'];
    _session = json['session'];
    _dateCreated = json['date_created'];
  }
  String? _privateId;
  String? _name;
  String? _roll;
  String? _registration;
  String? _technology;
  String? _session;
  String? _dateCreated;

  String? get privateId => _privateId;
  String? get name => _name;
  String? get roll => _roll;
  String? get registration => _registration;
  String? get technology => _technology;
  String? get session => _session;
  String? get dateCreated => _dateCreated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['private_id'] = _privateId;
    map['name'] = _name;
    map['roll'] = _roll;
    map['registration'] = _registration;
    map['technology'] = _technology;
    map['session'] = _session;
    map['date_created'] = _dateCreated;
    return map;
  }

}