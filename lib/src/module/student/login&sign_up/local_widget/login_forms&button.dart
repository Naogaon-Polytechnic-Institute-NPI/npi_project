import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/global_widget/txt_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';

class LoginFormsAndButton extends StatefulWidget {
  const LoginFormsAndButton({super.key});

  @override
  State<LoginFormsAndButton> createState() => _LoginFormsAndButtonState();
}

class _LoginFormsAndButtonState extends State<LoginFormsAndButton> {
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
      Response response = await post(Uri.parse(ApiEndPoints.login),
          body: {
            'roll': rollController.text.toString(),
            'password': passwordController.text.toString()
          }
      );
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['response'].toString() == 'success') {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) => HomeScreen()), (route) => false);
          Utils().toastMessage('Loged in', CustomColor.lightTeal);
        }else if(responseBody['response'].toString() == 'Roll not found !'){
          Utils().toastMessage('User not found', Colors.red);
        }else if(responseBody['response'].toString() == 'Password is incorrect'){
          Utils().toastMessage("Password didn't match", Colors.red);
        }
      }
    } catch (e) {
      setState(() {
        _loading = false ;
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
            InputField(
              //fieldTitle: 'Email',
                hintText: 'Enter your Roll',
                errorText: 'Enter Roll',
                obsecureText: false,
                textInputType: TextInputType.number,
                controller: rollController),
            Gap(10.h),
            InputField(
              //fieldTitle: 'Password',
              hintText: 'Enter your password',
              errorText: 'Enter password',
              obsecureText: _psecure,
              controller: passwordController,
              textInputType: TextInputType.text,
              suffixIcon: IconButton(
                icon: Icon(
                  _psecure ? Icons.remove_red_eye : Icons
                      .remove_red_eye_outlined,
                  color: CustomColor.lightTeal,
                ),
                onPressed: () {
                  setState(() {
                    passwordIsSecure();
                  });
                },
              ),
            ),
            TxtButton(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterEmail()));
                print('Working');
              },
              buttonName: 'Forgot password?',
              fontSize: 13.sp,
              color: CustomColor.blueGrey,
            ),
            CustomButton(
                loading: _loading,
                buttonName: 'Login',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _loading = true ;
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

