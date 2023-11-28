import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Create a veriable for SharedPreference Key
  static const String KEYLOGIN = "login";
  static const String userName = 'userName';
  static const String roll = 'roll';
  static const String privetKey = 'privetKey';

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

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
                  colors: [
                Colors.white,
                CustomColor.lightTeal.withOpacity(.5),
              ])),
          child: Center(
            child: SizedBox(
              height: 250.h,
              width: 250.w,
              child: Image.asset(
                'assets/images/npi_logo.png',
                fit: BoxFit.fill,
              ),
            ),
          )),
    );
  }

  void changeScreen() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    if (isLoggedIn != null) {
      if (isLoggedIn) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => HomeScreen(
                useName: sharedPref.getString(userName),
                roll: sharedPref.getString(roll),
                privetKey: sharedPref.getString(privetKey),
              )));
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LogInScreen()));
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    }
  }
}
