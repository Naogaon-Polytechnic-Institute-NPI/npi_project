import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/home/local_widget/info_input_field.dart';

class InputOccupationalInfo extends StatefulWidget {
  final String privetKey;
  const InputOccupationalInfo({super.key, required this.privetKey});

  @override
  State<InputOccupationalInfo> createState() => _InputOccupationalInfoState();
}

class _InputOccupationalInfoState extends State<InputOccupationalInfo> {
  final _formKey = GlobalKey<FormState>();
  final currnetOccupationController = TextEditingController();
  final occupationDetailsController = TextEditingController();
  bool _loading = false;

  void saveOccupationInfo()async{
    Map<String, dynamic> occupationData = {
      'currnetOccupation' : currnetOccupationController.text.toString(),
      'occupationDetails' : occupationDetailsController.text.toString(),
    };
    try {
      Response response = await post(Uri.parse('${ApiEndPoints.occupationInfoPost}${widget.privetKey}'),
          body: occupationData);
      if (response.statusCode == 200) {
        setState(() {
          _loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        if (responseBody['message'].toString() == 'Edit Complete' &&
            responseBody['response'].toString() == 'success') {
          Utils().toastMessage('Data Updated', CustomColor.lightTeal);
        } else if (responseBody['response'].toString() == 'success') {
          Utils().toastMessage('Data Saved', CustomColor.lightTeal);
        } else {
          Utils().toastMessage('server error!', Colors.red);
        }
      }else{
        Utils().toastMessage('server error!', Colors.red);
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
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: SizedBox(
          height: 500.h,
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
                  if(_formKey.currentState!.validate()) {
                    setState(() {
                      _loading = true;
                    });
                    saveOccupationInfo();
                    Navigator.pop(context);
                  }
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
