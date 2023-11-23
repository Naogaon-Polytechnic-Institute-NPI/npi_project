import 'package:flutter/material.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Creating a Method to change screen
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LogInScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Column(
          children: [
            Center(
              child: Text(
                "Splash Screen",
                style: TextStyle(color: Colors.red, fontSize: 30),
              ),
            )
          ],
        ));
  }
}
