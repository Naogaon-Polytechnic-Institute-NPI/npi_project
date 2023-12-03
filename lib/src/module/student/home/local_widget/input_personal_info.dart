// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/models/PersonalInfoModel.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/home/local_widget/info_input_field.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputPersonalInfo extends StatefulWidget {
  final String privetKey,
      userName;
  const InputPersonalInfo({
    required this.userName,
    required this.privetKey,
    super.key});

  @override
  State<InputPersonalInfo> createState() => InputPersonalInfoState();
}

class InputPersonalInfoState extends State<InputPersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  final UserData _userData = UserData();
  final nameController = TextEditingController();
  final fatherController = TextEditingController();
  final motherController = TextEditingController();
  final presentController = TextEditingController();
  final permanentController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();

  void savePersonalInfo()async{
    Map<String, dynamic> personalData = {
      'name' : nameController.text.toString(),
      'fatherName' : fatherController.text.toString(),
      'motherName' : motherController.text.toString(),
      'presentAddress' : presentController.text.toString(),
      'permanentAddress' : permanentController.text.toString(),
      'contactNumber' : contactController.text.toString(),
      'emailAddress' : emailController.text.toString()
    };
    try {
      Response response = await post(Uri.parse('${ApiEndPoints.personalInfoPost}${widget.privetKey}'),
          body: personalData);
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        print('this is the response $responseBody');
        if(responseBody['response'].toString() == 'success'){
          Utils().toastMessage('Data Updated', CustomColor.lightTeal);
        }
        else {
          Utils().toastMessage('server error!', Colors.red);
        }
      }
    }
      catch (e) {
      print('this is error ${e.toString()}');
    }
  }


  Future<void> getData() async {
    try {
      PersonalInfoModel personalInfoModel = await _userData.personalInfo(widget.privetKey);
      nameController.text = widget.userName;
      fatherController.text = personalInfoModel.personalData!.fatherName! ?? '';
      motherController.text = personalInfoModel.personalData!.motherName! ?? '';
      presentController.text = personalInfoModel.personalData!.presentAddress! ?? '';
      permanentController.text = personalInfoModel.personalData!.permanentAddress! ?? '';
      contactController.text = personalInfoModel.personalData!.contactNumber! ?? '';
      emailController.text = personalInfoModel.personalData!.emailAddress! ?? '';
    } catch (e) {
      //Utils().toastMessage('Error', Colors.red);
      print('Error fetching data: $e');
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
                child:Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InfoInputForm(
                                title: 'Name',
                                fieldHeight: 50.h,
                                fieldWidth: width,
                              hintText: '',
                              notEditable: true,
                              errorText: '',
                              controller: nameController,
                            ),
                            Gap(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoInputForm(
                                    title: 'Father Name',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    hintText: 'Enter Father Name',
                                  errorText: 'enter father name',
                                  controller: fatherController,
                                ),
                                Gap(5.w),
                                InfoInputForm(
                                    errorText: 'enter mother name',
                                    title: 'Mother Name',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    hintText: 'Enter Mother Name',
                                  controller: motherController,
                                ),
                              ],
                            ),
                            Gap(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoInputForm(
                                    errorText: 'enter address',
                                    title: 'Present address',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    hintText: 'Enter Present address',
                                  controller: presentController,
                                ),
                                InfoInputForm(
                                    errorText: 'enter address',
                                    title: 'Permanent address',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    hintText: 'Enter Permanent address',
                                  controller: permanentController,
                                ),
                              ],
                            ),
                            Gap(10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InfoInputForm(
                                    errorText: 'enter number',
                                    title: 'Contact number',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    textInputType: TextInputType.number,
                                    hintText: 'Enter contact number',
                                  controller: contactController,
                                ),
                                InfoInputForm(
                                    errorText: 'enter email',
                                    title: 'Email',
                                    fieldHeight: 50.h,
                                    fieldWidth: 161.w,
                                    textInputType: TextInputType.emailAddress,
                                    hintText: 'Enter email',
                                  controller: emailController,
                                ),
                              ],
                            ),
                            Gap(10.h),
                            CustomButton(onTap: ()async {
                              if(_formKey.currentState!.validate()) {
                                savePersonalInfo();
                                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                    builder: (context)=> HomeScreen(
                                      privetKey: sharedPreferences.getString(SplashScreenState.privetKey),
                                      useName: sharedPreferences.getString(SplashScreenState.userName),
                                      roll: sharedPreferences.getString(SplashScreenState.roll),
                                    )), (route) => false);
                              }
                            }, buttonName: 'SAVE')
                          ],
    )

                )
                ),
              ),
            ),
        ),

    );
  }
}
