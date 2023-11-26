import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final String errorText;
  final TextEditingController controller;
  final IconButton? suffixIcon;
  final TextInputType textInputType;
  const InputField({
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
                  borderSide: BorderSide(color: CustomColor.blueGrey.withOpacity(.2), width: 1.w)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: CustomColor.lightTeal, width: 1.w)
              ),
              fillColor: CustomColor.lightTeal.withOpacity(0.1),
              filled: true,
          //   enabledBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(color: CustomColor.lightTeal, width: 1)
          //   ),
          //   focusedBorder: UnderlineInputBorder(
          //       borderSide: BorderSide(color: CustomColor.lightTeal, width: 2.5)
          //   ),
          //    focusColor: CustomColor.lightTeal,
              suffixIcon: suffixIcon,
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