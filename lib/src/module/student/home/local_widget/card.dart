import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class CardTest extends StatelessWidget {
  const CardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 71.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.7),
        borderRadius: BorderRadius.circular(10.r)
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(10.w),
        leading: CircleAvatar(
          backgroundColor: CustomColor.lightTeal.withOpacity(.5),
          backgroundImage: const AssetImage('assets/images/profile.png'),
        ),
        title:Text(
          'Personal Info',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Roboto',
              color: CustomColor.blueGrey
          ),
        ),
        children: [

        ],
      ),
    );
  }
}
