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
import 'package:npi_project/src/data/global_widget/info_input_field.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInfo extends StatefulWidget {
  final String privetKey;

  const PersonalInfo({
    //required this.userName,
    required this.privetKey,
    super.key});

  @override
  State<PersonalInfo> createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  final UserData _userData = UserData();
  final nameController = TextEditingController();
  final fatherController = TextEditingController();
  final motherController = TextEditingController();
  final presentController = TextEditingController();
  final permanentController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();


  Future<void> getData() async {
    try {
      PersonalInfoModel personalInfoModel = await _userData.personalInfo(widget.privetKey);
      nameController.text = personalInfoModel.personalData!.name!;
      fatherController.text = personalInfoModel.personalData!.fatherName!;
      motherController.text = personalInfoModel.personalData!.motherName!;
      presentController.text = personalInfoModel.personalData!.presentAddress!;
      permanentController.text = personalInfoModel.personalData!.permanentAddress!;
      contactController.text = personalInfoModel.personalData!.contactNumber!;
      emailController.text = personalInfoModel.personalData!.emailAddress!;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Personal Data'),
        const Divider(
          color: Colors.blueGrey,
          thickness: 2,
        ),
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
              notEditable: true,
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
              notEditable: true,
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
              notEditable: true,
              hintText: 'Enter Present address',
              controller: presentController,
            ),
            InfoInputForm(
              errorText: 'enter address',
              title: 'Permanent address',
              fieldHeight: 50.h,
              fieldWidth: 161.w,
              notEditable: true,
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
              notEditable: true,
              textInputType: TextInputType.number,
              hintText: 'Enter contact number',
              controller: contactController,
            ),
            InfoInputForm(
              errorText: 'enter email',
              title: 'Email',
              fieldHeight: 50.h,
              fieldWidth: 161.w,
              notEditable: true,
              textInputType: TextInputType.emailAddress,
              hintText: 'Enter email',
              controller: emailController,
            ),
          ],
        ),
      ],
    );
  }
}
