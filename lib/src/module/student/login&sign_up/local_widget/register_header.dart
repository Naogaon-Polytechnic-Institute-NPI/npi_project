import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Verify yourself',
          style: TextStyle(
            color: CustomColor.lightTeal,
            fontSize: 25.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        //Gap(3.h),
        Text(
          'Enter your details',
          style: TextStyle(
              color: CustomColor.blueGrey,
              fontSize: 16.sp,
              fontFamily: 'Roboto'
          ),
        ),
      ],
    );
  }
}

