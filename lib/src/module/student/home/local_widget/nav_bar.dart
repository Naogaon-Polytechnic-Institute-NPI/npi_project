import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const DrawerHeader(
              child: Center(
            child: Column(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 42,
                    backgroundImage: AssetImage('assets/images/npi_logo.png')),
                SizedBox(
                  height: 5,
                ),
                Text('User Name', style: TextStyle(fontSize: 18)),
                SizedBox(
                  height: 5,
                ),
                Text('Roll')
              ],
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LogInScreen()),
                    (route) => false);
              },
              child: InkWell(
                onTap: () async {
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashScreenState.KEYLOGIN, false);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInScreen()));
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 4,
                            offset: Offset(5, 5))
                      ]),
                  child: Row(
                    children: [
                      const SizedBox(width: 15),
                      Image.asset('assets/images/exit.png'),
                      const SizedBox(width: 30),
                      Text(
                        'Log out',
                        style: TextStyle(fontSize: 16.sp, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
