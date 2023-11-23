import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome',
          style: TextStyle(color: const Color(0xff367588), fontSize: 20.sp),
        ),
        Gap(8.h),
        Text(
          'Welcome',
          style: TextStyle(color: const Color(0xff367588), fontSize: 20.sp),
        ),
      ],
    );
  }
}
