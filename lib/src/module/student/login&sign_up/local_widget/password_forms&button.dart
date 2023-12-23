// ignore_for_file: void_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/drop_down.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';



class PasswordFormsAndButton extends StatefulWidget {
  final String userName, roll, registration, technology, shift, session;
  const PasswordFormsAndButton({super.key,
  required this.userName,
    required this.roll,
    required this.registration,
    required this.technology,
    required this.shift,
    required this.session
  });

  @override
  State<PasswordFormsAndButton> createState() => _PasswordFormsAndButtonState();
}

class _PasswordFormsAndButtonState extends State<PasswordFormsAndButton> {

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _psecure = true, _cpSecure = true;
  bool loading = false;

  void passwordIsSecure (){
    _psecure = !_psecure;
  }
  void cPasswordIsSecure (){
    _cpSecure = !_cpSecure;
  }

  void savePassword() async {
    Map<String, dynamic> registerData = {
      'name' : widget.userName,
      'roll': widget.roll,
      'registration' : widget.registration,
      'technology' : widget.technology,
      'shift' : widget.shift,
      'session' : widget.session,
      'password' : confirmPasswordController.text.toString()
    };
    print(registerData);
    try {
      setState(() {
        loading = true;
      });
      Response response = await post(
          Uri.parse(ApiEndPoints.savePassword),
          body: registerData
      );
      if(response.statusCode == 200){
        setState(() {
          loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        debugPrint(responseBody['response']);
        if(responseBody['response'].toString() == 'success') {
          Utils().toastMessage('Successfully registered', CustomColor.lightTeal);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (_)=> const LogInScreen()), (route) => false);
        }else if(responseBody['response'].toString() == 'Something went wrong !') {
          Utils().toastMessage(
              'Fill the data properly', CustomColor.lightTeal);
        }else if(responseBody['response'].toString() == 'Roll/Registration/Session is not correct'){
          return Utils().
          toastMessage('Roll/Registration/Session is not correct', Colors.red);
        }else if(responseBody['response'].toString() == 'User  already have a account. Please Login'){
          return Utils().
          toastMessage('User already have an account', Colors.red);
        }else{
          return Utils().toastMessage('Server error!!', Colors.red);
        }
      }
    } catch (e) {
      setState(() {
        loading = false;
      });
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          InputField(
            //fieldTitle: 'Password',
            hintText: 'Enter your password',
            errorText: 'Enter password',
            obsecureText: _psecure,
            textInputType: TextInputType.visiblePassword,
            controller: passwordController,
            suffixIcon: IconButton(
              icon:Icon(_psecure? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: CustomColor.lightTeal,),
              onPressed: (){
                setState(() {
                  passwordIsSecure();
                });
              },),
          ),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Password',
            hintText: 'Enter confirm password',
            errorText: 'Enter password again',
            obsecureText: _cpSecure,
            textInputType: TextInputType.visiblePassword,
            controller: confirmPasswordController,
            suffixIcon: IconButton(
              icon:Icon(_cpSecure? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: CustomColor.lightTeal),
              onPressed: (){
                setState(() {
                  cPasswordIsSecure();
                });
              },),
          ),

          CustomButton(
              buttonName: 'Register',
              loading: loading,
              onTap: (){
                if(_formKey.currentState!.validate()){
                  if(passwordController.text.toString().length >= 6){
                    if(passwordController.text.toString() == confirmPasswordController.text.toString()){
                      setState(() {
                        loading = true;
                      });
                      savePassword();
                    } else {
                      return Utils().toastMessage("Password didn't match", Colors.red);
                    }
                  }else{
                    return Utils().toastMessage("Less than 6 character", Colors.red);
                  }
                }
                // print('hi ${sessionSelectedValue}');
                // print(technologySelectedValue);
              }
          )
        ],
      ),
    );
  }
}
