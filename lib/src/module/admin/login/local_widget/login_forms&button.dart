// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/admin/home/view/admin_home.dart';
import 'package:npi_project/src/module/admin/login/local_widget/custom_button.dart';
import 'package:npi_project/src/module/admin/login/local_widget/input_form.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminLoginFormsAndButton extends StatefulWidget {
  const AdminLoginFormsAndButton({super.key});

  @override
  State<AdminLoginFormsAndButton> createState() =>
      _AdminLoginFormsAndButtonState();
}

class _AdminLoginFormsAndButtonState extends State<AdminLoginFormsAndButton> {
  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _psecure = true;
  bool _loading = false;

  void passwordIsSecure() {
    _psecure = !_psecure;
  }

  void login() async {
    try {
      Response response = await post(Uri.parse(ApiEndPoints.adminLogin), body: {
        'username': userNameController.text.toString(),
        'email': emailController.text.toString(),
        'password': passwordController.text.toString()
      });
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['response'].toString() == 'Login Success') {

          SharedPreferences sharedPref = await SharedPreferences.getInstance();
          sharedPref.setBool(SplashScreenState.adminLoginKEY, true);

          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=> const AdminHome()), (route) => false);


          Utils().toastMessage('Loged in', CustomColor.deepOrange);
        } else if (responseBody['response'].toString() == 'User Not Found !') {
          Utils().toastMessage('User not found', Colors.red);
        } else if (responseBody['response'].toString() ==
            'Password is wrong !') {
          Utils().toastMessage("Password didn't match", Colors.red);
        } else if (responseBody['response'].toString() ==
            'Server is busy. Please try again.') {
          Utils().toastMessage("Server is busy", Colors.red);
        } else {
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
              hintText: 'Enter your username',
              errorText: 'Enter number',
              obsecureText: false,
              textInputType: TextInputType.text,
              controller: userNameController),
          Gap(10.h),
          AdminInputField(
              hintText: 'Enter your email',
              errorText: 'Enter email',
              obsecureText: false,
              textInputType: TextInputType.emailAddress,
              controller: emailController),
          Gap(10.h),
          AdminInputField(
            //fieldTitle: 'Password',
            hintText: 'Enter your password',
            errorText: 'Enter password',
            obsecureText: _psecure,
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
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
                }
              })
        ],
      ),
    );
  }
}
