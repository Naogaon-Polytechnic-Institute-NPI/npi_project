import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/module/student/home/local_widget/info_input_field.dart';

class InputOccupationalInfo extends StatefulWidget {

  const InputOccupationalInfo({super.key});

  @override
  State<InputOccupationalInfo> createState() => _InputOccupationalInfoState();
}

class _InputOccupationalInfoState extends State<InputOccupationalInfo> {
  final _formKey = GlobalKey<FormState>();
  final currnetOccupationController = TextEditingController();
  final occupationDetailsController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InfoInputForm(
                  title: 'Current occupation',
                  fieldHeight: 50.h,
                  fieldWidth: width,
                  hintText: 'Enter you occupation',
                  errorText: '',
                  controller: currnetOccupationController,

                ),
                Gap(10.h),
                InfoInputForm(
                  title: 'Occupation Details',
                  fieldHeight: 50.h,
                  fieldWidth: width,
                  hintText: 'Enter Occupation Details',
                  errorText: 'enter father name',
                  controller: occupationDetailsController,
                ),
                CustomButton(onTap: (){
                  Navigator.pop(context);
                },
                    buttonName: 'SAVE')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
