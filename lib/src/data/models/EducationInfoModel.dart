/// response : "Data Found !"
/// educational_info : [{"post_id":9,"institute_name":"Bogura Polytechnic Institute","studying":"Diploma in Engineering","subject_name":"Computer Engineering","passing_year":"2024"},{"post_id":10,"institute_name":"dfs","studying":"","subject_name":"","passing_year":""},{"post_id":11,"institute_name":"Bogura Polytechnic Institute","studying":"Diploma in Engineering","subject_name":"Computer Engineering","passing_year":"2024"}]

class EducationInfoModel {
  EducationInfoModel({
      String? response, 
      List<EducationalInfo>? educationalInfo,}){
    _response = response;
    _educationalInfo = educationalInfo;
}

  EducationInfoModel.fromJson(dynamic json) {
    _response = json['response'];
    if (json['educational_info'] != null) {
      _educationalInfo = [];
      json['educational_info'].forEach((v) {
        _educationalInfo?.add(EducationalInfo.fromJson(v));
      });
    }
  }
  String? _response;
  List<EducationalInfo>? _educationalInfo;

  String? get response => _response;
  List<EducationalInfo>? get educationalInfo => _educationalInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    if (_educationalInfo != null) {
      map['educational_info'] = _educationalInfo?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// post_id : 9
/// institute_name : "Bogura Polytechnic Institute"
/// studying : "Diploma in Engineering"
/// subject_name : "Computer Engineering"
/// passing_year : "2024"

class EducationalInfo {
  EducationalInfo({
      int? postId, 
      String? instituteName, 
      String? studying, 
      String? subjectName, 
      String? passingYear,}){
    _postId = postId;
    _instituteName = instituteName;
    _studying = studying;
    _subjectName = subjectName;
    _passingYear = passingYear;
}

  EducationalInfo.fromJson(dynamic json) {
    _postId = json['post_id'];
    _instituteName = json['institute_name'];
    _studying = json['studying'];
    _subjectName = json['subject_name'];
    _passingYear = json['passing_year'];
  }
  int? _postId;
  String? _instituteName;
  String? _studying;
  String? _subjectName;
  String? _passingYear;

  int? get postId => _postId;
  String? get instituteName => _instituteName;
  String? get studying => _studying;
  String? get subjectName => _subjectName;
  String? get passingYear => _passingYear;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['post_id'] = _postId;
    map['institute_name'] = _instituteName;
    map['studying'] = _studying;
    map['subject_name'] = _subjectName;
    map['passing_year'] = _passingYear;
    return map;
  }

}