import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/global_widget/title_text.dart';
import 'package:npi_project/src/data/global_widget/txt_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';


class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TitleText(
            titleText: "Didn't have an account?",
            fontSize: 13.sp,
            color: CustomColor.blueGrey),
        SizedBox(width: 5.w,),
        TxtButton(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
            print('working');
          },
            buttonName: 'Register',
            fontSize: 13.sp,
            color: CustomColor.lightTeal
        )
      ],
    );
  }
}
