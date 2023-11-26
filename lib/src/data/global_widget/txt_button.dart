
import 'package:flutter/material.dart';
import 'package:npi_project/src/data/global_widget/title_text.dart';

class TxtButton extends StatelessWidget {
  final String buttonName;
  final double fontSize;
  final Color color;
   dynamic onTap;
   TxtButton({super.key,
    required this.buttonName,
    required this.fontSize,
    required this.color,
     this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TitleText(
          titleText: buttonName,
          fontSize: fontSize,
          color: color),
    );
  }
}
