import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/module/admin/home/local_widget/Occupation_info.dart';
import 'package:npi_project/src/module/admin/home/local_widget/education_info.dart';
import 'package:npi_project/src/module/admin/home/local_widget/personal_info.dart';

class DetaildScreen extends StatelessWidget {
  final String privetKey;
  const DetaildScreen({super.key, required this.privetKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackButton(),
                  Gap(5.h),
                  PersonalInfo(privetKey: privetKey),
                  Gap(16.h),
                  EducationalInfo(privetKey: privetKey),
                  Gap(16.h),
                  OccupationInfo(privetKey: privetKey)
                ],
              ),
            ),
          ),
        ));
  }
}
