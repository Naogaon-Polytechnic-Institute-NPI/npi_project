import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/forgot_forms&button.dart';


class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
                  Text(
                      'Reset Your Password',
                      style: TextStyle(
                        color: CustomColor.lightTeal,
                        fontSize: 25.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(20.h),
                    const ForgotFormsAndButton(),
                    Gap(20.h),
                    // const LoginTxtButton()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
