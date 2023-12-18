import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/login_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/register_header.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/password_forms&button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/verify_form&button.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child:Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.w),

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
                const VerifyFormsAndButton(),
                Gap(20.h),
                const LoginTxtButton()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
