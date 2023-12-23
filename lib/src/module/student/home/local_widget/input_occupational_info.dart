// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/models/OccupationInfoModel.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/data/global_widget/info_input_field.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputOccupationalInfo extends StatefulWidget {
  final String privetKey;
  const InputOccupationalInfo({super.key, required this.privetKey});

  @override
  State<InputOccupationalInfo> createState() => _InputOccupationalInfoState();
}

class _InputOccupationalInfoState extends State<InputOccupationalInfo> {

  final occupationDetailsController = TextEditingController();
  bool _loading = false;
  final UserData _userData = UserData();
  static const List<String> workOption = [
    'Select a option',
    'Student',
    'Businessman',
    'Employed',
    'Not Employed',
    'Freelancer',
    'Others'
  ];
  String? selectedValue, selectedOccupation = '';


  void saveOccupationInfo() async {
    Map<String, dynamic> occupationData = {
      'currnetOccupation': selectedOccupation.toString(),
      'occupationDetails': occupationDetailsController.text.toString(),
    };
    try {
      setState(() {
        _loading = true;
      });
      Response response = await post(
          Uri.parse('${ApiEndPoints.occupationInfoPost}${widget.privetKey}'),
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
          SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    privetKey: sharedPreferences
                        .getString(SplashScreenState.privetKey),
                    useName:
                    sharedPreferences.getString(SplashScreenState.userName),
                    roll: sharedPreferences.getString(SplashScreenState.roll),
                  )),
                  (route) => false);
          Utils().toastMessage('Data Saved', CustomColor.lightTeal);
        } else if (responseBody['response'].toString() == 'Please set your current occupation.') {
          Utils().toastMessage('Select a job', CustomColor.lightTeal);
        } else {
          Utils().toastMessage('server error!', Colors.red);
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context)=> HomeScreen(
                privetKey: sharedPreferences.getString(SplashScreenState.privetKey),
                useName: sharedPreferences.getString(SplashScreenState.userName),
                roll: sharedPreferences.getString(SplashScreenState.roll),
              )), (route) => false);
        }
      } else {
        Utils().toastMessage('server error!', Colors.red);
      }
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      OccupationInfoModel occupationInfoModel = await _userData.occupationInfo(widget.privetKey);
      setState(() {
        selectedValue = occupationInfoModel.occupatioInfo!.currnetOccupation!.toString();
      });
      occupationDetailsController.text = occupationInfoModel.occupatioInfo!.occupationDetails ?? workOption.first;
    } catch (e) {
      setState(() {
        selectedValue = workOption.first;
      });
      //Utils().toastMessage('Error', Colors.red);
      print('Error fetching data: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: 500.h,
            child: Padding(
              padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 52.h,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: CustomColor.blueGrey.withOpacity(.2),
                            width: 1),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                      iconSize: 30,
                      dropdownColor: CustomColor.blueGrey,
                      elevation: 0,
                      borderRadius: BorderRadius.circular(10.r),
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        if(mounted){
                          if(newValue.toString() != workOption.first){
                            setState(() {
                              selectedValue = newValue.toString();
                              selectedOccupation = newValue.toString();
                            });
                          }else{
                            setState(() {
                              selectedOccupation = '';
                            });
                          }
                        }
                      },
                      items: workOption
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  Gap(10.h),
                  InfoInputForm(
                    title: 'Occupation Details',
                    fieldHeight: 50.h,
                    fieldWidth: width,
                    hintText: 'Enter Occupation Details',
                    errorText: 'enter occupation details',
                    controller: occupationDetailsController,
                  ),
                  CustomButton(
                      onTap: (){
                          saveOccupationInfo();

                        },
                      buttonName: 'SAVE')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
