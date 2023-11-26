import 'package:flutter/material.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircularPercentIndicator(
          radius: 40,
          lineWidth: 15,
          percent: 0.5,
          progressColor: CustomColor.lightTeal,
          backgroundColor: CustomColor.blueGrey,
          circularStrokeCap: CircularStrokeCap.round,
          center: Text(
            '50%',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Text('Complete your Profile')
      ],
    );
  }
}
