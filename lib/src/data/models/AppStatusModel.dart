import 'dart:convert';
AppStatusModel appStatusModelFromJson(String str) => AppStatusModel.fromJson(json.decode(str));
String appStatusModelToJson(AppStatusModel data) => json.encode(data.toJson());
class AppStatusModel {
  AppStatusModel({
      String? appVersion,
      String? newVersionDownloadLink, 
      String? underMaintenance,}){
    _appVersion = appVersion;
    _newVersionDownloadLink = newVersionDownloadLink;
    _underMaintenance = underMaintenance;
}

  AppStatusModel.fromJson(dynamic json) {
    _appVersion = json['app_version'];
    _newVersionDownloadLink = json['new_version_download_link'];
    _underMaintenance = json['under_maintenance'];
  }
  String? _appVersion;
  String? _newVersionDownloadLink;
  String? _underMaintenance;
AppStatusModel copyWith({  String? appVersion,
  String? newVersionDownloadLink,
  String? underMaintenance,
}) => AppStatusModel(  appVersion: appVersion ?? _appVersion,
  newVersionDownloadLink: newVersionDownloadLink ?? _newVersionDownloadLink,
  underMaintenance: underMaintenance ?? _underMaintenance,
);
  String? get appVersion => _appVersion;
  String? get newVersionDownloadLink => _newVersionDownloadLink;
  String? get underMaintenance => _underMaintenance;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_version'] = _appVersion;
    map['new_version_download_link'] = _newVersionDownloadLink;
    map['under_maintenance'] = _underMaintenance;
    return map;
  }

}