import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/module/student/home/local_widget/educataion_Info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/greeting.dart';
import 'package:npi_project/src/module/student/home/local_widget/occupation_info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/personal_info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/profile_indicator_part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(24.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //     colors:[
              //       Colors.white,
              //       CustomColor.lightTeal.withOpacity(.5),
              //     ]
              // )
          ),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GreetingPart(),
                const ProfileIndicatorPart(),
                Gap(20.h),
                const PersonalInfoCard(),
                const EducationInfoCard(),
                const OccupationInfoCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
