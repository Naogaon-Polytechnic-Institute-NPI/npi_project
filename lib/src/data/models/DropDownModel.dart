/// response : "success"
/// dropdownList : [{"id":3,"session":"CMT"},{"id":4,"session":"CIVIL"},{"id":5,"session":"ENVT"},{"id":6,"session":"AIDT"}]

class DropDownModel {
  DropDownModel({
      String? response, 
      List<DropdownList>? dropdownList,}){
    _response = response;
    _dropdownList = dropdownList;
}

  DropDownModel.fromJson(dynamic json) {
    _response = json['response'];
    if (json['dropdownList'] != null) {
      _dropdownList = [];
      json['dropdownList'].forEach((v) {
        _dropdownList?.add(DropdownList.fromJson(v));
      });
    }
  }
  String? _response;
  List<DropdownList>? _dropdownList;

  String? get response => _response;
  List<DropdownList>? get dropdownList => _dropdownList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['response'] = _response;
    if (_dropdownList != null) {
      map['dropdownList'] = _dropdownList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 3
/// session : "CMT"

class DropdownList {
  DropdownList({
      int? id, 
      String? session,}){
    _id = id;
    _session = session;
}

  DropdownList.fromJson(dynamic json) {
    _id = json['id'];
    _session = json['session'];
  }
  int? _id;
  String? _session;

  int? get id => _id;
  String? get session => _session;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['session'] = _session;
    return map;
  }

}