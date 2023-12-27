import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/AppStatusModel.dart';

class AppStatus{
  Future<AppStatusModel> getAppStatus() async{
    try {
      final response = await http.get(Uri.parse(ApiEndPoints.appStatus));


      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        print(responseBody.toString());
        return AppStatusModel.fromJson(responseBody);
      } else {
        throw Exception('Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      throw Exception('Failed to fetch data. Error: $error');
    }
  }
}