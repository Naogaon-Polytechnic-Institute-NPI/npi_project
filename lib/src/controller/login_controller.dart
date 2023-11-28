// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:npi_project/src/controller/api_end_points.dart';
// import 'package:npi_project/src/data/utils/custom_color.dart';
// import 'package:npi_project/src/data/utils/toast.dart';
// import 'package:npi_project/src/module/student/home/view/home.dart';
// import 'package:npi_project/src/splash_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginController{
//   void login() async {
//     try {
//       Response response = await post(Uri.parse(ApiEndPoints.login), body: {
//         'roll': rollController.text.toString(),
//         'password': passwordController.text.toString()
//       });
//       if (response.statusCode == 200) {
//         setState(() {
//           _loading = false;
//         });
//         var responseBody = jsonDecode(response.body.toString());
//         if (responseBody['response'].toString() == 'success') {
//
//           // If Successfully Logged In (creds are correct)
//           var sharedPref = await SharedPreferences.getInstance();
//           sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
//
//           // Navigator.pushAndRemoveUntil(
//           //     context,
//           //     MaterialPageRoute(builder: (context) => HomeScreen()),
//           //     (route) => false);
//
//           Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
//               builder: (context) => HomeScreen(
//                 useName: responseBody['studentData']['name'],
//                 roll: responseBody['studentData']['roll'],
//                 privetKey: responseBody['studentData']["private_id"],
//               )), (route) => false);
//
//           Utils().toastMessage('Loged in', CustomColor.lightTeal);
//         } else if (responseBody['response'].toString() == 'Roll not found !') {
//           Utils().toastMessage('User not found', Colors.red);
//         } else if (responseBody['response'].toString() ==
//             'Password is incorrect') {
//           Utils().toastMessage("Password didn't match", Colors.red);
//         }else{
//           return Utils().toastMessage('Server error!!', Colors.red);
//         }
//       }
//     } catch (e) {
//       setState(() {
//         _loading = false;
//       });
//       print(e.toString());
//     }
//   }
// }
