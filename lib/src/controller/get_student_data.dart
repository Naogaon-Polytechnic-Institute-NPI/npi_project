import 'dart:convert';

import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/AdminViewStudent.dart';
import 'package:http/http.dart' as http;

class GetStudentsData{

  Future<AdminViewStudent> getFilteredData(String technology, session) async{
    final response = await http.get(Uri.parse('${ApiEndPoints.filteredData}technology=$technology&session=$session'));
    var responseBody = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return AdminViewStudent.fromJson(responseBody);
    }else{
      return AdminViewStudent.fromJson(responseBody);
    }
  }
}