import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/login_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/register_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/register_header.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/signup_forms&button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/welcome_text.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.w),
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors:[
            //           Colors.white,
            //           CustomColor.lightTeal.withOpacity(.5),
            //         ]
            //     )
            // ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 110.h,
                  width: 110.w,
                  child: Image.asset(
                      'assets/images/npi_logo.png',
                      fit: BoxFit.cover
                  ),
                ),
                Gap(10.h),
                const RegisterHeader(),
                Gap(20.h),
                const RegisterFormsAndButton(),
                Gap(20.h),
                const LoginTxtButton()
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
