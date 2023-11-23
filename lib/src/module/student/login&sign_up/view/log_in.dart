import 'package:flutter/material.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/welcome_text.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WelcomeText()
          ],
        )
      ),
    );
  }
}
