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



class ForgotFormsAndButton extends StatefulWidget {
  const ForgotFormsAndButton({super.key});

  @override
  State<ForgotFormsAndButton> createState() => _ForgotFormsAndButtonState();
}

class _ForgotFormsAndButtonState extends State<ForgotFormsAndButton> {
  String? technologySelectedValue;
  String? sessionSelectedValue;

  final _formKey = GlobalKey<FormState>();
  final rollController = TextEditingController();
  final registrationController = TextEditingController();
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

  void register() async {
    Map<String, dynamic> registerData = {
      'roll': rollController.text.toString(),
      'registration' : registrationController.text.toString(),
      'technology' : technologySelectedValue.toString(),
      'session' : sessionSelectedValue.toString(),
      'new_password' : confirmPasswordController.text.toString()
    };
    print(registerData);
    try {
      setState(() {
        loading = true;
      });
      Response response = await post(
          Uri.parse(ApiEndPoints.resetPasswordVerify),
        body: registerData
      );
      if(response.statusCode == 200){
        setState(() {
          loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        debugPrint(responseBody['response']);
        if(responseBody['response'].toString() == 'User Found') {
          try{
            Response signUpResponse = await post(Uri.parse(ApiEndPoints.changePassword),
                body: registerData
            );
            if(response.statusCode == 200){
              var signupResponseBody = jsonDecode(signUpResponse.body.toString());
              print(signupResponseBody);
              if(signupResponseBody['response'].toString() == 'Password Changed'){
                Utils().toastMessage(
                    'Password Changed', CustomColor.lightTeal);
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(
                    builder: (context)=> const LogInScreen()), (route) => false);
              }
            }
            else{
              Utils().toastMessage('Server error!', Colors.red);
            }
          }catch(e){
            print(e.toString());
          }
        }else if(responseBody['response'].toString() == 'User not Registered'){
          return Utils().
          toastMessage('User not Registered', Colors.red);
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
    rollController.dispose();
    registrationController.dispose();
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
              hintText: 'Enter your Roll',
              errorText: 'Enter roll',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: rollController),
          Gap(10.h),
          InputField(
              hintText: 'Enter your Registration',
              errorText: 'Enter registration',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: registrationController),
          Gap(10.h),
          DropDown(
              apiEndpoint: ApiEndPoints.technologyList,
              onValueChanged: (selectedId){
                setState(() {
                  technologySelectedValue = selectedId;
                });
              },
              hintText: 'Enter your technology'),
          Gap(10.h),
          DropDown(
              apiEndpoint: ApiEndPoints.sessionList,
              onValueChanged: (selectedId){
                setState(() {
                  sessionSelectedValue = selectedId;
                });
              },
              hintText: 'Enter your session'),
          Gap(10.h),
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
              buttonName: 'Reset',
              loading: loading,
              onTap: () {
                    if (_formKey.currentState!.validate()) {
                        if (passwordController.text
                            .toString()
                            .length >= 6) {
                          if (passwordController.text.toString() ==
                              confirmPasswordController.text.toString()) {
                            setState(() {
                              loading = true;
                            });
                            register();
                          } else {
                            return Utils().toastMessage(
                                "Password didn't match", Colors.red);
                          }
                        } else {
                          return Utils().toastMessage(
                              "Less than 6 character", Colors.red);
                        }
                      }
                    }
          )
        ],
      ),
    );
  }
}
