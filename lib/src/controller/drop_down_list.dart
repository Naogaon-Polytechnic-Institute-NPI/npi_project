// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:npi_project/src/data/utils/toast.dart';
// import '../data/models/DropDownModel.dart';
// import 'package:http/http.dart' as http;
//
// class DropDownListController{
//
//   Future <DropDownModel> dropDown(String apiEndPoints)async{
//
//       final response = await http.get(Uri.parse(apiEndPoints));
//       if(response.statusCode == 200){
//         var responseBody = jsonDecode(response.body);
//         return DropDownModel.fromJson(responseBody);
//       }else if(response.statusCode == 500){
//         Utils().toastMessage('Server error!', Colors.red);
//         throw Exception('Server error');
//       }else{
//         Utils().toastMessage('unknown error!', Colors.red);
//         throw Exception('unknown error!');
//     }
// }
// }

