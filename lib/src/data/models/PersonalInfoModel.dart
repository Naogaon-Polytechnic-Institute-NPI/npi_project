/// personal_data : {"name":"Md Shadikul Islam Shafi","father_name":"Md Hafizul Islam","mother_name":"Mst. Sabera Sultana","present_address":"Naogaon Sadar, Naogaon","permanent_address":"Naogaon Sadar, Naogaon","contact_number":"01585953674","email_address":"mdshadikulislamshafi@gmail.com"}

class PersonalInfoModel {
  PersonalInfoModel({
      PersonalData? personalData,}){
    _personalData = personalData;
}

  PersonalInfoModel.fromJson(dynamic json) {
    _personalData = json['personal_data'] != null ? PersonalData.fromJson(json['personal_data']) : null;
  }
  PersonalData? _personalData;

  PersonalData? get personalData => _personalData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_personalData != null) {
      map['personal_data'] = _personalData?.toJson();
    }
    return map;
  }

}

/// name : "Md Shadikul Islam Shafi"
/// father_name : "Md Hafizul Islam"
/// mother_name : "Mst. Sabera Sultana"
/// present_address : "Naogaon Sadar, Naogaon"
/// permanent_address : "Naogaon Sadar, Naogaon"
/// contact_number : "01585953674"
/// email_address : "mdshadikulislamshafi@gmail.com"

class PersonalData {
  PersonalData({
      String? name, 
      String? fatherName, 
      String? motherName, 
      String? presentAddress, 
      String? permanentAddress, 
      String? contactNumber, 
      String? emailAddress,}){
    _name = name;
    _fatherName = fatherName;
    _motherName = motherName;
    _presentAddress = presentAddress;
    _permanentAddress = permanentAddress;
    _contactNumber = contactNumber;
    _emailAddress = emailAddress;
}

  PersonalData.fromJson(dynamic json) {
    _name = json['name'];
    _fatherName = json['father_name'];
    _motherName = json['mother_name'];
    _presentAddress = json['present_address'];
    _permanentAddress = json['permanent_address'];
    _contactNumber = json['contact_number'];
    _emailAddress = json['email_address'];
  }
  String? _name;
  String? _fatherName;
  String? _motherName;
  String? _presentAddress;
  String? _permanentAddress;
  String? _contactNumber;
  String? _emailAddress;

  String? get name => _name;
  String? get fatherName => _fatherName;
  String? get motherName => _motherName;
  String? get presentAddress => _presentAddress;
  String? get permanentAddress => _permanentAddress;
  String? get contactNumber => _contactNumber;
  String? get emailAddress => _emailAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['father_name'] = _fatherName;
    map['mother_name'] = _motherName;
    map['present_address'] = _presentAddress;
    map['permanent_address'] = _permanentAddress;
    map['contact_number'] = _contactNumber;
    map['email_address'] = _emailAddress;
    return map;
  }

}