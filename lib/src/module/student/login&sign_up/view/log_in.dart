import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/login_forms&button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/register_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/welcome_text.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const WelcomeText(),
                Gap(15.h),
                SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: Image.asset('assets/images/npi_logo.png',
                      fit: BoxFit.fill),
                ),
                Gap(30.h),
                const LoginFormsAndButton(),
                Gap(20.h),
                const RegisterButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
