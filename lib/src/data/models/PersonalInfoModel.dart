/// response : "Data Found !"
/// personal_data : {"name":"Md Shadikul Islam Shafi","father_name":"ddd","mother_name":"","present_address":"","permanent_address":"","contact_number":"","email_address":""}

class PersonalInfoModel {
  PersonalInfoModel({
      String? response, 
      PersonalData? personalData,}){
    _response = response;
    _personalData = personalData;
}

  PersonalInfoModel.fromJson(dynamic json) {
    _response = json['response'];
    _personalData = json['personal_data'] != null ? PersonalData.fromJson(json['personal_data']) : null;
  }
  String? _response;
  PersonalData? _personalData;

  String? get response => _response;
  PersonalData? get personalData => _personalData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    if (_personalData != null) {
      map['personal_data'] = _personalData?.toJson();
    }
    return map;
  }

}

/// name : "Md Shadikul Islam Shafi"
/// father_name : "ddd"
/// mother_name : ""
/// present_address : ""
/// permanent_address : ""
/// contact_number : ""
/// email_address : ""

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