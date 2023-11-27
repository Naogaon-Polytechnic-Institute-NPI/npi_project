import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class DataText extends StatelessWidget {
  final String? dataTitle, userData;
  final double height;
  const DataText({
    required this.dataTitle,
    this.userData,
    this.height = 50,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.w, 5.h, 10.w, 5.h),
      //alignment: Alignment.center,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '$dataTitle :',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 15.sp
            ),
          ),
          Gap(5.w),
          Text(
            '$userData',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
            ),
          )
        ],
      ),
    );
  }
}
