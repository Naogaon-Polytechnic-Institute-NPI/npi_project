/// response : [{"institute_name":"Naogaon Polytechnic Institute","studying":"Diploma in Engineering","subject_name":"Computer Engineering","passing_year":"2024"}]

class EducationInfoModel {
  EducationInfoModel({
      List<Response>? response,}){
    _response = response;
}

  EducationInfoModel.fromJson(dynamic json) {
    if (json['response'] != null) {
      _response = [];
      json['response'].forEach((v) {
        _response?.add(Response.fromJson(v));
      });
    }
  }
  List<Response>? _response;

  List<Response>? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// institute_name : "Naogaon Polytechnic Institute"
/// studying : "Diploma in Engineering"
/// subject_name : "Computer Engineering"
/// passing_year : "2024"

class Response {
  Response({
      String? instituteName, 
      String? studying, 
      String? subjectName, 
      String? passingYear,}){
    _instituteName = instituteName;
    _studying = studying;
    _subjectName = subjectName;
    _passingYear = passingYear;
}

  Response.fromJson(dynamic json) {
    _instituteName = json['institute_name'];
    _studying = json['studying'];
    _subjectName = json['subject_name'];
    _passingYear = json['passing_year'];
  }
  String? _instituteName;
  String? _studying;
  String? _subjectName;
  String? _passingYear;

  String? get instituteName => _instituteName;
  String? get studying => _studying;
  String? get subjectName => _subjectName;
  String? get passingYear => _passingYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['institute_name'] = _instituteName;
    map['studying'] = _studying;
    map['subject_name'] = _subjectName;
    map['passing_year'] = _passingYear;
    return map;
  }

}