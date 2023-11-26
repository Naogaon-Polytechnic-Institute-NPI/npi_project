import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileIndicatorPart extends StatelessWidget {
  const ProfileIndicatorPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.5),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 10,
            percent: 0.5,
            progressColor: CustomColor.lightTeal,
            backgroundColor: CustomColor.blueGrey,
            circularStrokeCap: CircularStrokeCap.round,
            center: const Text(
              '50%',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Gap(5.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Complete your Profile',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16.sp,
                  color: CustomColor.blueGrey
                ),
              ),
              Gap(8.w),
              Icon(Icons.edit_rounded, color: CustomColor.lightTeal,),

            ],
          )
        ],
      )
    );
  }
}
