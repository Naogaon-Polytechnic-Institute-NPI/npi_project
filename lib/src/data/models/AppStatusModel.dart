import 'dart:convert';
AppStatusModel appStatusModelFromJson(String str) => AppStatusModel.fromJson(json.decode(str));
String appStatusModelToJson(AppStatusModel data) => json.encode(data.toJson());
class AppStatusModel {
  AppStatusModel({
      String? newVersionAvailable, 
      String? newVersionDownloadLink, 
      String? underMaintenance,}){
    _newVersionAvailable = newVersionAvailable;
    _newVersionDownloadLink = newVersionDownloadLink;
    _underMaintenance = underMaintenance;
}

  AppStatusModel.fromJson(dynamic json) {
    _newVersionAvailable = json['new_version_available'];
    _newVersionDownloadLink = json['new_version_download_link'];
    _underMaintenance = json['under_maintenance'];
  }
  String? _newVersionAvailable;
  String? _newVersionDownloadLink;
  String? _underMaintenance;
AppStatusModel copyWith({  String? newVersionAvailable,
  String? newVersionDownloadLink,
  String? underMaintenance,
}) => AppStatusModel(  newVersionAvailable: newVersionAvailable ?? _newVersionAvailable,
  newVersionDownloadLink: newVersionDownloadLink ?? _newVersionDownloadLink,
  underMaintenance: underMaintenance ?? _underMaintenance,
);
  String? get newVersionAvailable => _newVersionAvailable;
  String? get newVersionDownloadLink => _newVersionDownloadLink;
  String? get underMaintenance => _underMaintenance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['new_version_available'] = _newVersionAvailable;
    map['new_version_download_link'] = _newVersionDownloadLink;
    map['under_maintenance'] = _underMaintenance;
    return map;
  }

}