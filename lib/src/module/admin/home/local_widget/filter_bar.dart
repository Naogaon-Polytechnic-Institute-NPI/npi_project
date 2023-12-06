import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/module/admin/home/local_widget/custom_button.dart';
import 'package:npi_project/src/module/admin/home/local_widget/drop_down.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropDown(
                  apiEndpoint: ApiEndPoints.technologyList,
                  onValueChanged: (selectedId){
                  },
                  hintText: 'select technology'
              ),
              //Gap(5.w),
              DropDown(
                  apiEndpoint: ApiEndPoints.sessionList,
                  onValueChanged: (selectedId){
                  },
                  hintText: 'select session'
              )
            ],
        ),
        Gap(8.h),
        CustomButton(
          onTap: (){},
        )
      ],
    );
  }
}
