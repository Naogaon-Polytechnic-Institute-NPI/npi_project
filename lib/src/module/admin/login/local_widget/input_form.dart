import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class AdminInputField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final String errorText;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  const AdminInputField({
    super.key,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    required this.errorText,
    required this.textInputType,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
          controller: controller,
          autofocus: false,
          focusNode: FocusNode(),
          obscureText: obsecureText,
          keyboardType: textInputType,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: CustomColor.blueGrey,
                fontFamily: 'Roboto',
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(
                      color: CustomColor.blueGrey.withOpacity(.2), width: 1.w)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide:
                      BorderSide(color: CustomColor.deepOrange, width: 1.w)),
              fillColor: CustomColor.deepOrange.withOpacity(0.1),
              filled: true,

              suffixIcon: suffixIcon),
          validator: (value){
            if(value!.isEmpty){

              return errorText;
            }
            return null;
          }),
    );
  }
}
