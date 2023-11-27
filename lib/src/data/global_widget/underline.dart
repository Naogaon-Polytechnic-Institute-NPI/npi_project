import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnderLine extends StatelessWidget {
  const UnderLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      width: MediaQuery.of(context).size.width,
      color: Colors.black45,
    );
  }
}
