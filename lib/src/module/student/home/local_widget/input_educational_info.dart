import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/module/student/home/local_widget/info_input_field.dart';

class InputEducationalInfo extends StatefulWidget {

  const InputEducationalInfo({super.key});

  @override
  State<InputEducationalInfo> createState() => _InputEducationalInfoState();
}

class _InputEducationalInfoState extends State<InputEducationalInfo> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final fatherController = TextEditingController();
  final motherController = TextEditingController();
  final presentController = TextEditingController();
  final permanentController = TextEditingController();
  final contactController = TextEditingController();
  final emailController = TextEditingController();

  bool _loading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
            // child: Column(
            //   mainAxisSize: MainAxisSize.max,
            //   children: [
            //     InfoInputForm(
            //       title: 'Name',
            //       fieldHeight: 50.h,
            //       fieldWidth: width,
            //       hintText: '',
            //       notEditable: true,
            //       errorText: '',
            //       controller: nameController,
            //
            //     ),
            //     Gap(10.h),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InfoInputForm(
            //           title: 'Father Name',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter Father Name',
            //           errorText: 'enter father name',
            //           controller: fatherController,
            //         ),
            //         Gap(5.w),
            //         InfoInputForm(
            //           errorText: 'enter mother name',
            //           title: 'Mother Name',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter Mother Name',
            //           controller: motherController,
            //         ),
            //       ],
            //     ),
            //     Gap(10.h),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InfoInputForm(
            //           errorText: 'enter address',
            //           title: 'Present address',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter Present address',
            //           controller: presentController,
            //         ),
            //         InfoInputForm(
            //           errorText: 'enter address',
            //           title: 'Permanent address',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter Permanent address',
            //           controller: permanentController,
            //         ),
            //       ],
            //     ),
            //     Gap(10.h),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InfoInputForm(
            //           errorText: 'enter number',
            //           title: 'Contact number',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter contact number',
            //           controller: contactController,
            //         ),
            //         InfoInputForm(
            //           errorText: 'enter email',
            //           title: 'Email',
            //           fieldHeight: 50.h,
            //           fieldWidth: 161.w,
            //           hintText: 'Enter email',
            //           controller: emailController,
            //         ),
            //       ],
            //     ),
            //     Gap(10.h),
            //     CustomButton(onTap: (){
            //       Navigator.pop(context);
            //     },
            //         buttonName: 'SAVE')
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
