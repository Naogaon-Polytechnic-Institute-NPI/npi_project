import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/EducationInfoModel.dart';
import 'package:npi_project/src/data/models/OccupationInfoModel.dart';
import 'package:npi_project/src/data/models/PersonalInfoModel.dart';
import 'package:npi_project/src/data/utils/toast.dart';

class UserData {
  double _personalData = 0;
  double get personalData => _personalData;

  Future<PersonalInfoModel> personalInfo(String privateKey) async {
    final response = await http.get(Uri.parse('${ApiEndPoints.personalInfoGet}$privateKey'));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());
      print(responseData.toString());
      if (responseData['response'].toString() == 'Data Found !') {
        print('Personal data found');
        _personalData = 0.40;
        return PersonalInfoModel.fromJson(responseData);
      }else{
        return PersonalInfoModel.fromJson(responseData);
      }
    } else if (response.statusCode == 500) {
      Utils().toastMessage('Server error!', Colors.red);
      throw Exception('Server error');
    } else {
      Utils().toastMessage('Unknown error!', Colors.red);
      throw Exception('Unknown error');
    }
  }

  double _educationalData = 0;
  double get educationalData => _educationalData;

  Future<EducationInfoModel> educationInfo(String privateKey) async {
    final response = await http.get(Uri.parse('${ApiEndPoints.educationInfoGet}$privateKey'));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());
      print(responseData.toString());
      if (responseData['response'].toString() == 'Data Found !') {
        print('Educational data found');
        _educationalData = 0.30;
        return EducationInfoModel.fromJson(responseData);
      }else{
        return EducationInfoModel.fromJson(responseData);
      }
    } else if (response.statusCode == 500) {
      Utils().toastMessage('Server error!', Colors.red);
      throw Exception('Server error');
    } else {
      Utils().toastMessage('Unknown error!', Colors.red);
      throw Exception('Unknown error');
    }
  }

  double _occupationData = 0;
  double get occupationData => _occupationData;

  Future<OccupationInfoModel> occupationInfo(String privateKey) async {
    final response = await http.get(Uri.parse('${ApiEndPoints.occupationInfoGet}$privateKey'));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());

      if (responseData['response'].toString() == 'Data Found') {
        print('Occupation data found');
        _occupationData = 0.30;
      }

      print(responseData.toString());
      return OccupationInfoModel.fromJson(responseData);
    } else if (response.statusCode == 500) {
      Utils().toastMessage('Server error!', Colors.red);
      throw Exception('Server error');
    } else {
      Utils().toastMessage('Unknown error!', Colors.red);
      throw Exception('Unknown error');
    }
  }

  double _progress = 0;
  double get progress => _progress;

  calculateProgress() {
    _progress = _personalData + _educationalData + _occupationData;
    print('Value of progress: $_progress');
  }
}
