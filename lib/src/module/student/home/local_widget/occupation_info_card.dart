import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class OccupationInfoCard extends StatelessWidget {
  const OccupationInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(.7),
      elevation: 0,
      child: ExpansionTile(
        tilePadding: EdgeInsets.all(10.w),
        leading: const CircleAvatar(
          backgroundColor: CustomColor.lightTeal,
          backgroundImage: AssetImage('assets/images/businessman.png'),

        ),
        title:Text(
          'Occupation Info',
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