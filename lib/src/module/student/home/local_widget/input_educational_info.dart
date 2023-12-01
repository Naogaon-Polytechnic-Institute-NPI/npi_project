// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/home/local_widget/info_input_field.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputEducationalInfo extends StatefulWidget {
  final String privetKey;
  const InputEducationalInfo({super.key, required this.privetKey});

  @override
  State<InputEducationalInfo> createState() => _InputEducationalInfoState();
}

class _InputEducationalInfoState extends State<InputEducationalInfo> {
  final _formKey = GlobalKey<FormState>();
  final instituteController = TextEditingController();
  final courseController = TextEditingController();
  final subjectController = TextEditingController();
  final passingYearController = TextEditingController();

  bool _loading = false;

  void saveEducationalInfo()async{
    Map<String, dynamic> educationalData = {
      'instituteName' : instituteController.text.toString(),
      'studying' : courseController.text.toString(),
      'subjectName' : subjectController.text.toString(),
      'passingYear' : passingYearController.text.toString(),
    };
    try {
      Response response = await post(Uri.parse('${ApiEndPoints.educationInfoPost}${widget.privetKey}'),
          body: educationalData);
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['response'].toString() == 'success') {
          Utils().toastMessage('Data Saved', CustomColor.lightTeal);
        } else {
          Utils().toastMessage('server error!', Colors.red);
        }
      }
    }
    catch (e) {
      setState(() {
        _loading = false;
      });
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InfoInputForm(
                          title: 'Institute Name',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'Enter institute name',
                          errorText: 'Enter institute name',
                          controller: instituteController,

                        ),
                        Gap(10.h),
                        InfoInputForm(
                          title: 'Course name',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'Enter course name',
                          errorText: 'Enter course name',
                          controller: courseController,

                        ),
                        Gap(10.h),
                        InfoInputForm(
                          title: 'Subject Name',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'Enter subject name',
                          errorText: 'Enter subject name',
                          controller: subjectController,

                        ),
                        Gap(10.h),
                        InfoInputForm(
                          title: 'Passing year',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'Enter passing year',
                          errorText: 'Enter passing year',
                          controller: passingYearController,
                        ),
                        Gap(10.h),
                        CustomButton(onTap: ()async {
                          if(_formKey.currentState!.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            saveEducationalInfo();
                            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                builder: (context)=> HomeScreen(
                                  privetKey: sharedPreferences.getString(SplashScreenState.privetKey),
                                  useName: sharedPreferences.getString(SplashScreenState.userName),
                                  roll: sharedPreferences.getString(SplashScreenState.roll),
                                )), (route) => false);
                        }
                        },
                            buttonName: 'SAVE')
                      ],
                    )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
