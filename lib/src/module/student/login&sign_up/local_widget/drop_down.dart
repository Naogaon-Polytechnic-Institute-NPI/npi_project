import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class DropdownExample extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onChanged;
  final List <String> options;
  const DropdownExample({super.key ,
    required this.selectedValue,
    required this.onChanged,
    required this.options});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 52.h,
      width: MediaQuery.sizeOf(context).width,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: CustomColor.lightTeal.withOpacity(0.1),
        border: Border.all(color: CustomColor.blueGrey.withOpacity(.2), width: 1),
        borderRadius: BorderRadius.circular(25.r)
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          'Enter your technology',
          style: TextStyle(
            color: CustomColor.blueGrey,
            fontFamily: 'Roboto',
            fontSize: 15.sp,
          ),
        ),
        underline: const SizedBox(),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 16.sp,
          color: Colors.black,
        ),
        iconSize: 30,
        dropdownColor: CustomColor.blueGrey,
        elevation: 0,
        borderRadius: BorderRadius.circular(10.r),
        value: selectedValue ?? null, // Use null if selectedValue is null
        onChanged: onChanged,
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

    );
  }
}