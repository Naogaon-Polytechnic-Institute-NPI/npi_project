// ignore_for_file: void_checks, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';



class RegisterFormsAndButton extends StatefulWidget {
  const RegisterFormsAndButton({super.key});

  @override
  State<RegisterFormsAndButton> createState() => _RegisterFormsAndButtonState();
}

class _RegisterFormsAndButtonState extends State<RegisterFormsAndButton> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final rollController = TextEditingController();
  final registrationController = TextEditingController();
  final technologyController = TextEditingController();
  final sessionController = TextEditingController();
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
      'name' : usernameController.text.toString(),
      'roll': rollController.text.toString(),
      'registration' : registrationController.text.toString(),
      'technology' : technologyController.text.toString(),
      'session' : sessionController.text.toString(),
      'password' : confirmPasswordController.text.toString()
    };
    try {
      setState(() {
        loading = true;
      });
      Response response = await post(
          Uri.parse(ApiEndPoints.signUp),
        body: registerData
      );
      if(response.statusCode == 200){
        setState(() {
          loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        debugPrint(responseBody['response']);
        if(responseBody['response'].toString() == 'success') {
          try{
            Response signUpResponse = await post(Uri.parse(ApiEndPoints.savePassword),
                body: registerData
            );
            if(response.statusCode == 200){
              var signupResponseBody = jsonDecode(signUpResponse.body.toString());
              print(signupResponseBody);
              if(signupResponseBody['response'].toString() == 'success'){
                Utils().toastMessage(
                    'Account created successfully', CustomColor.lightTeal);
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(
                    builder: (context)=> LogInScreen()), (route) => false);
              }else if(signupResponseBody['response'].toString() == 'User  already have a account. Please Login'){
                Utils().toastMessage('Already have an account', CustomColor.lightTeal);
              }
            }
          }catch(e){
            print(e.toString());
          }
        }else if(responseBody['response'].toString() == 'Something went wrong !') {
          Utils().toastMessage(
              'Fill the data properly', CustomColor.lightTeal);
        }else if(responseBody['response'].toString() == 'Roll/Registration/Session is not correct'){
          return Utils().
          toastMessage('Roll/Registration/Session is not correct', Colors.red);
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
  void dispose() {
    usernameController.dispose();
    rollController.dispose();
    registrationController.dispose();
    technologyController.dispose();
    sessionController.dispose();
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
              //fieldTitle: 'Username',
              hintText: 'Enter your name',
              errorText: 'Enter name',
              obsecureText: false,
              textInputType: TextInputType.name,
              controller: usernameController
          ),
          Gap(10.h),
          InputField(
              //fieldTitle: 'Email',
              hintText: 'Enter your Roll',
              errorText: 'Enter roll',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: rollController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your Registration',
              errorText: 'Enter registration',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: registrationController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your technology (CMT)',
              errorText: 'Enter roll',
              obsecureText: false,
              textInputType: TextInputType.text,
              controller: technologyController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your session (18-19)',
              errorText: 'Enter roll',
              obsecureText: false,
              textInputType: TextInputType.number,
              controller: sessionController),
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
              buttonName: 'Register',
              loading: loading,
              onTap: ()async {
                if(_formKey.currentState!.validate()){
                  if(passwordController.text.toString().length >= 6){
                    if(passwordController.text.toString() == confirmPasswordController.text.toString()){
                      setState(() {
                        loading = true;
                      });
                      register();
                    } else {
                      return Utils().toastMessage("Password didn't match", Colors.red);
                    }
                  }else{
                    return Utils().toastMessage("Less than 6 character", Colors.red);
                  }
                }
              }
          )
        ],
      ),
    );
  }
}
