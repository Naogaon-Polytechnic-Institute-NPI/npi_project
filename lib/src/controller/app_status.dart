import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/AppStatusModel.dart';
import 'package:flutter/material.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';

class AppStatus{
  Future<AppStatusModel> getAppStatus(BuildContext context) async{
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.appStatus));


      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        print(responseBody.toString());
        return AppStatusModel.fromJson(responseBody);
      } else {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> const LogInScreen()), (route) => false);
        throw Exception('Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to fetch data. Error: $error');
    }
  }
}