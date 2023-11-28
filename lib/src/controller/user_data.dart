import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/EducationInfoModel.dart';
import 'package:npi_project/src/data/models/OccupationInfoModel.dart';
import 'package:npi_project/src/data/models/PersonalInfoModel.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/home/local_widget/educataion_Info_card.dart';
class UserData{

  Future<PersonalInfoModel> personalInfo(String privetKey)async{
    final response = await http.get(Uri.parse('${ApiEndPoints.personalInfoGet}$privetKey'));
    var responseData = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      print(responseData.toString());
      return PersonalInfoModel.fromJson(responseData);
    }else if(response.statusCode == 500){
      return Utils().toastMessage('server error!', Colors.red);
    }else{
      return Utils().toastMessage('server error!', Colors.red);
    }
  }

  Future<EducationInfoModel> educationInfo(String privetKey)async{
    final response = await http.get(Uri.parse('${ApiEndPoints.educationInfoGet}$privetKey'));
    var responseData = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      print(responseData.toString());
      return EducationInfoModel.fromJson(responseData);
    }else if(response.statusCode == 500){
      return Utils().toastMessage('server error!', Colors.red);
    }else{
      return EducationInfoModel.fromJson(responseData);
    }
  }

  Future<OccupationInfoModel> occupationInfo(String privetKey)async{
    final response = await http.get(Uri.parse('${ApiEndPoints.occupationInfoGet}$privetKey'));
    var responseData = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      print(responseData.toString());
      return OccupationInfoModel.fromJson(responseData);
    }else if(response.statusCode == 500){
      return Utils().toastMessage('server error!', Colors.red);
    }else{
      return Utils().toastMessage('server error!', Colors.red);
    }
  }


}