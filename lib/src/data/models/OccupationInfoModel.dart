/// response : "Data Found"
/// occupatio_info : {"currnet_occupation":"job","occupation_details":"I'm currently employed in Dream IT as  Junior Android Developer"}

class OccupationInfoModel {
  OccupationInfoModel({
      String? response, 
      OccupatioInfo? occupatioInfo,}){
    _response = response;
    _occupatioInfo = occupatioInfo;
}

  OccupationInfoModel.fromJson(dynamic json) {
    _response = json['response'];
    _occupatioInfo = json['occupatio_info'] != null ? OccupatioInfo.fromJson(json['occupatio_info']) : null;
  }
  String? _response;
  OccupatioInfo? _occupatioInfo;

  String? get response => _response;
  OccupatioInfo? get occupatioInfo => _occupatioInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    if (_occupatioInfo != null) {
      map['occupatio_info'] = _occupatioInfo?.toJson();
    }
    return map;
  }

}

/// currnet_occupation : "job"
/// occupation_details : "I'm currently employed in Dream IT as  Junior Android Developer"

class OccupatioInfo {
  OccupatioInfo({
      String? currnetOccupation, 
      String? occupationDetails,}){
    _currnetOccupation = currnetOccupation;
    _occupationDetails = occupationDetails;
}

  OccupatioInfo.fromJson(dynamic json) {
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