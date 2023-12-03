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
import 'package:npi_project/src/module/student/home/local_widget/drop_down.dart';
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
  String? selectedCourse;
  final instituteController = TextEditingController();
  final courseController = TextEditingController();
  final subjectController = TextEditingController();
  final passingYearController = TextEditingController();


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
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['response'].toString() == 'success') {
          Utils().toastMessage('Data Saved', CustomColor.lightTeal);
        } else {
          Utils().toastMessage('server error!', Colors.red);
        }
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=> HomeScreen(
              privetKey: sharedPreferences.getString(SplashScreenState.privetKey),
              useName: sharedPreferences.getString(SplashScreenState.userName),
              roll: sharedPreferences.getString(SplashScreenState.roll),
            )), (route) => false);
      }
    }
    catch (e) {
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
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Text(
                          'Course Name',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14.sp,
                          ),
                        ),
                        Gap(7.h),
                        DropDown(
                          hintText: 'Enter Course name',
                            apiEndpoint: ApiEndPoints.courseList,
                            onValueChanged: (selectedId){
                              setState(() {
                                selectedCourse = selectedId;
                              });
                              print('selected curse $selectedCourse');
                            }),
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
                            saveEducationalInfo();
                            //Navigator.pop(context);
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
