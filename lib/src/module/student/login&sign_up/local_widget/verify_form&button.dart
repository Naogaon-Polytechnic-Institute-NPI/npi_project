// ignore_for_file: void_checks, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/drop_down.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';
import 'package:http/http.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/save_password.dart';



class VerifyFormsAndButton extends StatefulWidget {
  const VerifyFormsAndButton({super.key});

  @override
  State<VerifyFormsAndButton> createState() => _VerifyFormsAndButtonState();
}

class _VerifyFormsAndButtonState extends State<VerifyFormsAndButton> {
  static const List<String> shift = [
    'Select Shift',
    '1st',
    '2nd',
  ];
  String? shiftSelectedValue;
  String? technologySelectedValue;
  String? sessionSelectedValue;
  final _formKey = GlobalKey<FormState>();
  final rollController = TextEditingController();
  final registrationController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;




  void verify() async {
    Map<String, dynamic> registerData = {
      'roll': rollController.text.toString(),
      'registration' : registrationController.text.toString(),
      'technology' : technologySelectedValue.toString(),
      'shift' : shiftSelectedValue.toString(),
      'session' : sessionSelectedValue.toString(),

    };
    print(registerData);
    try {
      setState(() {
        loading = true;
      });
      Response response = await post(
          Uri.parse(ApiEndPoints.verify),
          body: registerData
      );
      if(response.statusCode == 200){
        setState(() {
          loading = false;
        });
        var responseBody = jsonDecode(response.body.toString());
        debugPrint(responseBody['response']);
        if(responseBody['response'].toString() == 'success') {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (_)=> SavePassword(
                  userName: responseBody['student_name'],
                roll: rollController.text.toString(),
                registration: registrationController.text.toString(),
                technology: technologySelectedValue.toString(),
                shift: shiftSelectedValue.toString(),
                session: sessionSelectedValue.toString(),
              )),
                  (route) => false);
          Utils().toastMessage('Verified', CustomColor.lightTeal);
        }else if(responseBody['response'].toString() == 'Something went wrong !') {
          Utils().toastMessage(
              'Fill the data properly', CustomColor.lightTeal);
        }else if(responseBody['response'].toString() == 'Roll/Registration/Technology/Session is not correct'){
          return Utils().
          toastMessage('Credential are not correct', Colors.red);
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
    rollController.dispose();
    registrationController.dispose();
    passwordController.dispose();
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
          DropDown(
            hintText: 'Enter your technology',
            apiEndpoint: ApiEndPoints.technologyList,
            onValueChanged: (selectedId) {
              setState(() {
                technologySelectedValue = selectedId;
              });
              print('Dropdown 1 - Selected ID: $selectedId');
            },
          ),
          Gap(10.h),
          Container(
              alignment: Alignment.center,
              height: 52.h,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: CustomColor.lightTeal.withOpacity(0.1),
                  border: Border.all(color: CustomColor.blueGrey.withOpacity(.2), width: 1),
                  borderRadius: BorderRadius.circular(25.r)
              ),
              child:DropdownButton(
                isExpanded: true,
                hint: Text(
                  'Select Shift',
                  style: TextStyle(
                    color: CustomColor.blueGrey,
                    fontFamily: 'Roboto',
                    fontSize: 15.sp,
                  ),
                ),
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
                value: shiftSelectedValue,
                onChanged: (String? newValue) {
                  if(mounted){
                    setState(() {
                      shiftSelectedValue = newValue.toString();
                    });
                  }
                },
                items: shift
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
          ),
          Gap(10.h),
          DropDown(
            hintText: 'Enter your session',
            apiEndpoint: ApiEndPoints.sessionList,
            onValueChanged: (selectedId) {
              setState(() {
                sessionSelectedValue = selectedId;
              });
              print('Dropdown 1 - Selected ID: $selectedId');
            },
          ),


          CustomButton(
              buttonName: 'Verify',
              loading: loading,
              onTap: (){
                if(_formKey.currentState!.validate()){
                  verify();
                   }
              }
          )
        ],
      ),
    );
  }
}
