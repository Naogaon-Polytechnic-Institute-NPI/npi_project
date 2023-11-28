import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoInputForm extends StatelessWidget {
  final String title, hintText, errorText;
  final double fieldHeight, fieldWidth;
  final bool notEditable;
  final String? initialValue;
  final TextEditingController controller;
  const InfoInputForm({
    super.key,
    required this.title,
    required this.fieldHeight,
    required this.fieldWidth,
    required this.hintText,
    required this.errorText,
    this.notEditable = false,
    required this.controller,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 14.sp,
          ),
        ),
        Gap(7.h),
        SizedBox(
          height: fieldHeight,
          width: fieldWidth,
          child: TextFormField(

            //initialValue: initialValue,
            controller: controller,
              readOnly: notEditable,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: 'Roboto',
                      color: const Color(0xff9A9A9A)
                  ),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE8E8E8))
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffE8E8E8))
                  ),
              ),
              validator: (value){
                if(value!.isEmpty){

                  return errorText;
                }
                return null;
              }),
        ),
      ],
    );
  }
}