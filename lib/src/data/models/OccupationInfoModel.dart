/// occupationInfo : {"currnet_occupation":"Student","occupation_details":"Currently i am a stident of Naogaon Polytechnic Institute"}

class OccupationInfoModel {
  OccupationInfoModel({
      OccupationInfo? occupationInfo,}){
    _occupationInfo = occupationInfo;
}

  OccupationInfoModel.fromJson(dynamic json) {
    _occupationInfo = json['occupationInfo'] != null ? OccupationInfo.fromJson(json['occupationInfo']) : null;
  }
  OccupationInfo? _occupationInfo;

  OccupationInfo? get occupationInfo => _occupationInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_occupationInfo != null) {
      map['occupationInfo'] = _occupationInfo?.toJson();
    }
    return map;
  }

}

/// currnet_occupation : "Student"
/// occupation_details : "Currently i am a stident of Naogaon Polytechnic Institute"

class OccupationInfo {
  OccupationInfo({
      String? currnetOccupation, 
      String? occupationDetails,}){
    _currnetOccupation = currnetOccupation;
    _occupationDetails = occupationDetails;
}

  OccupationInfo.fromJson(dynamic json) {
    _currnetOccupation = json['currnet_occupation'];
    _occupationDetails = json['occupation_details'];
  }
  String? _currnetOccupation;
  String? _occupationDetails;

  String? get currnetOccupation => _currnetOccupation;
  String? get occupationDetails => _occupationDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currnet_occupation'] = _currnetOccupation;
    map['occupation_details'] = _occupationDetails;
    return map;
  }

}