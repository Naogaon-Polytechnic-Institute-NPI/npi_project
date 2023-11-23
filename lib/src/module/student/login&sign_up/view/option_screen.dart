import 'package:flutter/material.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
             begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.white,
              CustomColor.lightTeal.withOpacity(.5),
            ]
          )
        ),
      ),
    );
  }
}
