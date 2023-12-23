import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleText extends StatelessWidget {
  final String titleText;
  final double fontSize;
  final Color color;
  const TitleText({
    super.key,
    required this.titleText,
    required this.fontSize,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w,),
      child: Text(
        titleText,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: fontSize,
          color: color,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}
