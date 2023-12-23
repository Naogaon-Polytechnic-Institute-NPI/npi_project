import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/login/view/log_in.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/login_forms&button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/register_txt_button.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/welcome_text.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child:Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.w),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=> const AdminLogInScreen()));
                        },
                        child: const Text(
                          'Admin login',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: CustomColor.deepOrange
                          ),
                        )
                    ),
                  ],
                ),
                Gap(40.h),
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
    ));
  }

}
