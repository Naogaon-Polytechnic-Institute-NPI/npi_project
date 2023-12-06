import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class CustomButton extends StatelessWidget {
  final dynamic onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: CustomColor.deepOrange,
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Text(
          'Filter',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 18.sp
          ),
        ),
      ),
    );
  }
}
