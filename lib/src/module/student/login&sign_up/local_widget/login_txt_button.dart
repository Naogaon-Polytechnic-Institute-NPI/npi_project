import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/global_widget/title_text.dart';
import 'package:npi_project/src/data/global_widget/txt_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/password_forms&button.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/signup.dart';


class LoginTxtButton extends StatelessWidget {
  const LoginTxtButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TitleText(
            titleText: "Already have an account?",
            fontSize: 13.sp,
            color: CustomColor.blueGrey),
        SizedBox(width: 5.w,),
        TxtButton(
            onTap: (){
              Navigator.pushAndRemoveUntil(
                  context, MaterialPageRoute(builder: (context)=>
              const LogInScreen()), (route) => false);
              print('working');
            },
            buttonName: 'Login',
            fontSize: 13.sp,
            color: CustomColor.lightTeal
        )
      ],
    );
  }
}