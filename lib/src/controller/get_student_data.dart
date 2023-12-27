import 'dart:convert';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:npi_project/src/data/models/StudentsModel.dart';

class GetStudentsData{

  Future<StudentsModel> getFilteredData(String technology, session, roll, shift) async {
    try {
      final response = await http.get(Uri.parse(
          '${ApiEndPoints.filteredData}?technology=$technology&session=$session&roll=$roll&shift=$shift'));
      print('end point: ${ApiEndPoints.filteredData}?technology=$technology&session=$session&roll=$roll&shift=$shift');

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        print(responseBody.toString());
        //return AdminView.fromJson(responseBody);
        return StudentsModel.fromJson(responseBody);
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

}