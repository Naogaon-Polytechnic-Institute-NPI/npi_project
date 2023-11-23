import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/welcome_text.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const WelcomeText(),
            Gap(14.h),
            SizedBox(
              height: 130.h,
              width: 130.w,
              child: Image.asset(
                  'assets/images/npi_logo.png',
                  fit: BoxFit.cover
              ),
            ),
            Gap(16.h),

          ],
        )
      ),
    );
  }
}
