import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/login_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/password_forms&button.dart';

class SavePassword extends StatelessWidget {
  final String userName, roll, registration, technology, shift, session;
  const SavePassword({super.key,
    required this.userName,
    required this.roll,
    required this.registration,
    required this.technology,
    required this.shift,
    required this.session
  });

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
                Column(
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        color: CustomColor.lightTeal,
                        fontSize: 20.sp,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    //Gap(3.h),
                    Text(
                      'Please Enter your password',
                      style: TextStyle(
                          color: CustomColor.blueGrey,
                          fontSize: 16.sp,
                          fontFamily: 'Roboto'
                      ),
                    ),
                  ],
                ),
                    Gap(20.h),
                    PasswordFormsAndButton(
                      userName: userName,
                      roll: roll,
                      registration: registration,
                      technology: technology,
                      shift: shift,
                      session: session,
                    ),
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
