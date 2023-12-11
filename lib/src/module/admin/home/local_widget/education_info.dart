// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/models/PersonalInfoModel.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/data/global_widget/info_input_field.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EducationalInfo extends StatefulWidget {
  final String privetKey;

  const EducationalInfo({
    //required this.userName,
    required this.privetKey,
    super.key});

  @override
  State<EducationalInfo> createState() => EducationalInfoState();
}

class EducationalInfoState extends State<EducationalInfo> {
  final UserData _userData = UserData();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Educational Data',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 18.sp
          ),
        ),
        const Divider(
          color: Colors.blueGrey,
          thickness: 2,
        ),
        FutureBuilder(
            future: _userData.educationInfo(widget.privetKey),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: CustomColor.deepOrange,
                      size: 50),
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.educationalInfo!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InfoInputForm(
                          title: '${[index+1]} .Institute Name',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'No Data Found',
                          notEditable: true,
                          errorText: 'No Data Found',
                          initialValue: snapshot.data!.educationalInfo![index]
                              .instituteName,

                        ),

                        Gap(10.h)
                        ,
                        InfoInputForm(
                          title: 'Course Name',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          notEditable: true,
                          hintText: 'No Data Found',
                          errorText: 'No Data Found',
                          initialValue: snapshot.data!.educationalInfo![index].studying,
                        ),

                        Gap(10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        InfoInputForm(
                          errorText: 'No Data Found',
                          title: 'Subject Name',
                          fieldHeight: 50.h,
                          fieldWidth: 161.w,
                          notEditable: true,
                          hintText: 'No Data Found',
                          initialValue: snapshot.data!.educationalInfo![index].subjectName,
                        ),
                        InfoInputForm(
                          errorText: 'No Data Found',
                          title: 'Passing Year',
                          fieldHeight: 50.h,
                          fieldWidth: 161.w,
                          notEditable: true,
                          hintText: 'No Data Found',
                          initialValue: snapshot.data!.educationalInfo![index].passingYear,
                        ),
                          ],
                        ),
                        Gap(20.h)
                    ]
                    );
                  }
              );
            }
        ),
      ],
    );
  }
}
