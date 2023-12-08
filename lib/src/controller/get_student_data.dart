import 'dart:convert';
import 'dart:ffi';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/models/AdminViewStudent.dart';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/data/models/TestView.dart';

class GetStudentsData{
  dynamic _apiResponse;

  get apiResponse => _apiResponse;

  Stream<AdminView> getFilteredData(String technology, String session) async* {
    try {
      final response = await http.get(Uri.parse('${ApiEndPoints.filteredData}?technology=$technology&session=$session'));
      print('end point: ${ApiEndPoints.filteredData}?technology=$technology&session=$session');

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        print(responseBody.toString());
        yield AdminView.fromJson(responseBody);
      } else {
        // Handle error case, throw an exception or return an error result
        throw Exception('Failed to fetch data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any exceptions during the request
      print('Error: $error');
      throw Exception('Failed to fetch data. Error: $error');
    }
  }

  // Future<dynamic> getFilteredData(String technology, String session) async {
  //   try {
  //     final response = await http.get(Uri.parse('${ApiEndPoints.filteredData}?technology=$technology&session=$session'));
  //     print('end point: ${ApiEndPoints.filteredData}?technology=$technology&session=$session');
  //
  //     if (response.statusCode == 200) {
  //       var responseBody = jsonDecode(response.body.toString());
  //       print(responseBody.toString());
  //       return _apiResponse = responseBody;
  //     } else {
  //       // Handle error case, throw an exception or return an error result
  //       throw Exception('Failed to fetch data. Status Code: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle any exceptions during the request
  //     print('Error: $error');
  //     throw Exception('Failed to fetch data. Error: $error');
  //   }
  // }
}