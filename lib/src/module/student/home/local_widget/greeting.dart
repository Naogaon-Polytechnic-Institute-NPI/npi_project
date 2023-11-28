import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class GreetingPart extends StatelessWidget {
 final String userName;
  const GreetingPart({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 170.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Greeting',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 40.sp,
            color: CustomColor.lightTeal
          ),),
          //Gap(5.h),
          Text(
            userName,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: 'Roboto',
            color: CustomColor.blueGrey
          ),)
        ],
      ),
    );
  }
}
