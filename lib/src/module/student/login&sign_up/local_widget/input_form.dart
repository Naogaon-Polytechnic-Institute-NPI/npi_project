import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final String errorText;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  const InputField({
    super.key,
    required this.hintText,
    required this.obsecureText,
    required this.controller,
    required this.errorText,
    this.suffixIcon
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: TextFormField(
          controller: controller,
          obscureText: obsecureText,
          decoration: InputDecoration(
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: CustomColor.blueGrey.withOpacity(.2), width: 1.w)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: CustomColor.lightTeal, width: 1.w)
              ),
              fillColor: CustomColor.lightTeal.withOpacity(0.1),
              filled: true,
              suffixIcon: suffixIcon
          ),
          validator: (value){
            if(value!.isEmpty){
              return errorText;
            }
            return null;
          }
      ),
    );
  }
}