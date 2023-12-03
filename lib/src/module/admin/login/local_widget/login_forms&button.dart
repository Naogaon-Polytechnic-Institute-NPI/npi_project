import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/admin/login/local_widget/custom_button.dart';
import 'package:npi_project/src/module/admin/login/local_widget/input_form.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginFormsAndButton extends StatefulWidget {
  const AdminLoginFormsAndButton({super.key});

  @override
  State<AdminLoginFormsAndButton> createState() => _AdminLoginFormsAndButtonState();
}

class _AdminLoginFormsAndButtonState extends State<AdminLoginFormsAndButton> {
  final _formKey = GlobalKey<FormState>();
  final rollController = TextEditingController();
  final passwordController = TextEditingController();
  bool _psecure = true;
  bool _loading = false;

  void passwordIsSecure() {
    _psecure = !_psecure;
  }

  void login() async {
    try {
      Response response = await post(Uri.parse(ApiEndPoints.login), body: {
        'roll': rollController.text.toString(),
        'password': passwordController.text.toString()
      });
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['response'].toString() == 'success') {

          // If Successfully Logged In (creds are correct)
          SharedPreferences sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(SplashScreenState.KEYLOGIN, true);
          sharedPref.setString(SplashScreenState.userName, responseBody['studentData']['name']);
          sharedPref.setString(SplashScreenState.roll, responseBody['studentData']['roll']);
          sharedPref.setString(SplashScreenState.privetKey, responseBody['studentData']['private_id']);

          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => HomeScreen()),
          //     (route) => false);

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => HomeScreen(
                useName: responseBody['studentData']['name'],
                roll: responseBody['studentData']['roll'],
                privetKey: responseBody['studentData']["private_id"],
              )), (route) => false);

          Utils().toastMessage('Loged in', CustomColor.lightTeal);
        } else if (responseBody['response'].toString() == 'Roll not found !') {
          Utils().toastMessage('User not found', Colors.red);
        } else if (responseBody['response'].toString() ==
            'Password is incorrect') {
          Utils().toastMessage("Password didn't match", Colors.red);
        }else{
          Utils().toastMessage('Server error!!', Colors.red);
        }
      }
    } catch (e) {
      setState(() {
        _loading = false;
      });
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AdminInputField(
              hintText: 'Enter your number',
              errorText: 'Enter number',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: rollController),
          Gap(10.h),
          AdminInputField(
              hintText: 'Enter your email',
              errorText: 'Enter email',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: rollController),
          Gap(10.h),
          AdminInputField(
            //fieldTitle: 'Password',
            hintText: 'Enter your password',
            errorText: 'Enter password',
            obsecureText: _psecure,
            controller: passwordController,
            textInputType: TextInputType.text,
            suffixIcon: IconButton(
              icon: Icon(
                _psecure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                color: CustomColor.deepOrange,
              ),
              onPressed: () {
                setState(() {
                  passwordIsSecure();
                });
              },
            ),
          ),
          Gap(20.h),
          AdminCustomButton(
              loading: _loading,
              buttonName: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  setState(() {
                    _loading = true;
                  });
                  login();
                  print('working');
                  print(rollController.text.toString());
                  print(passwordController.text.toString());
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                }
              })
        ],
      ),
    );
  }
}
