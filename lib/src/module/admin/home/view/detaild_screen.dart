import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              height: MediaQuery.sizeOf(context).height,

              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                      child: PersonalInfo(privetKey: privetKey))
                ],
              ),
            ),
          ),
        ));
  }
}
