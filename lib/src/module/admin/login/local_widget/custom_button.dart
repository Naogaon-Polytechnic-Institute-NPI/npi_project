import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class AdminCustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  final bool loading;
  const AdminCustomButton({
    super.key,
    required this.buttonName,
    required this.onTap,
    this.loading = false

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        height: 50.h,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: CustomColor.deepOrange,
            borderRadius: BorderRadius.circular(25.r),
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors:[
            //       CustomColor.pearGreen.withOpacity(.5),
            //       CustomColor.jadeGreen,
            //     ]
            // ),
          boxShadow: const [
            BoxShadow(
              color: CustomColor.blueGrey,
              blurRadius: 9,
              spreadRadius: 3,
              offset: Offset(0, 5)
            )
          ]
        ),
        child: loading? const CircularProgressIndicator( color: Colors.white, strokeWidth: 3,) :
        Text(
          buttonName,
          style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500
          ),),
      ),
    );
  }
}