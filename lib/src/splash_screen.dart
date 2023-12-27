// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/controller/app_status.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/models/AppStatusModel.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/home/view/admin_home.dart';
import 'package:npi_project/src/module/admin/login/view/log_in.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // Create a veriable for SharedPreference Key
  static const String studentLoginKEY = "StudentLogin";
  static const String adminLoginKEY = "AdminLogin";
  static const String userName = 'userName';
  static const String roll = 'roll';
  static const String privetKey = 'privetKey';
  final AppStatus _appStatus = AppStatus();

  @override
  void initState() {
    appStatus();
    //changeScreen();
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

  Future<void> appStatus()async{
    AppStatusModel appStatusModel = await _appStatus.getAppStatus();

    if(appStatusModel.newVersionAvailable == 'True'){
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.pink[100],
              icon: const Icon(Icons.info),
              title: const Text('Update here'),
              //content: const Text('Are you sure you want to Log out?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                        onPressed: () async {
                          _launchUrl(Uri.parse('${appStatusModel.newVersionDownloadLink}'));
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                ),
              ],
            );
          });
    }else if(appStatusModel.underMaintenance == 'True'){
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              // backgroundColor: Colors.pink[100],
              icon: const Icon(Icons.info),
              title: const Text('Under Maintenance'),
              //content: const Text('Are you sure you want to Log out?'),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                        onPressed: () async {
                         exit(0);
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                ),
              ],
            );
          });
    }else{
      changeScreen();
    }
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void changeScreen() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    var isStudentLoggedIn = sharedPref.getBool(studentLoginKEY);
    var isAdminLoggedIn = sharedPref.getBool(adminLoginKEY);

    if (isStudentLoggedIn == null && isAdminLoggedIn == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    } else if (isStudentLoggedIn == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      useName: sharedPref.getString(userName),
                      roll: sharedPref.getString(roll),
                      privetKey: sharedPref.getString(privetKey),
                    )));
      });
    } else if (isAdminLoggedIn == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const AdminHome()),
        );
      });
    } else if (isStudentLoggedIn == false) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LogInScreen()));
      });
    } else if (isAdminLoggedIn == false) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AdminLogInScreen()));
      });
    }
  }
}
