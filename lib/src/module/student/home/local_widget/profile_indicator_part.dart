import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileIndicatorPart extends StatefulWidget {
  final String privetKey;

  const ProfileIndicatorPart({required this.privetKey, Key? key}) : super(key: key);

  @override
  _ProfileIndicatorPartState createState() => _ProfileIndicatorPartState();
}

class _ProfileIndicatorPartState extends State<ProfileIndicatorPart> {
  static const String progressValueKey = 'progressValue';
  double? progressValue;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    UserData userData = UserData();
    await userData.personalInfo(widget.privetKey);
    await userData.educationInfo(widget.privetKey);
    await userData.occupationInfo(widget.privetKey);
    await userData.calculateProgress();
    setState(() {

    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(progressValueKey, userData.progress);
    progressValue = sharedPreferences.getDouble(progressValueKey);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: 130,
      decoration: BoxDecoration(
        color: CustomColor.lightTeal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 40,
            lineWidth: 10,
            percent: progressValue ?? 0.0, // Use the null-aware operator
            progressColor: CustomColor.lightTeal,
            backgroundColor: CustomColor.blueGrey,
            circularStrokeCap: CircularStrokeCap.round,
            animation: true,
            center: Text(
              '${((progressValue ?? 0.0) * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                  fontSize: 16.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: CustomColor.blueGrey
              ),
            ),
          ),
          Gap(8.h),
          Text(
            'Completed ${((progressValue ?? 0.0) * 100).toStringAsFixed(0)}% of your Profile',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16.sp,
              color: CustomColor.blueGrey,
            ),
          )
        ],
      ),
    );
  }
}
