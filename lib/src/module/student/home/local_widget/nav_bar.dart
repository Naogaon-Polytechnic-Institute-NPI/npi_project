import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/get_student_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/login&sign_up/view/log_in.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  final String userName, roll;
  const NavBar({required this.userName, required this.roll, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // backgroundColor: Colors.pink[100],
            icon: const Icon(Icons.info),
            title: const Text('Log Out'),
            content: const Text('Are you sure you want to Log out?'),

            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                      onPressed: () async {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.clear();
                        LoadingAnimationWidget.bouncingBall(color: Colors.red, size: 100);
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()),
                            (route) => false);
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.red),
                      )),
                  CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No')),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              children: [
                DrawerHeader(
                    child: Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 42,
                          backgroundImage:
                              AssetImage('assets/images/npi_logo.png')),
                      Gap(5.h),
                      Text(widget.userName,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500)),
                      Gap(5.h),
                      Text(widget.roll)
                    ],
                  ),
                )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: InkWell(
                    onTap: _showDialog,
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
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            //padding: EdgeInsets.only(bottom: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: GetStudentsData().getFilteredData('', '', '', ''),
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return LoadingAnimationWidget.waveDots(
                            color: CustomColor.lightTeal, size: 30);
                      } else {
                        return Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                            Gap(5.w),
                            Text(
                              'Total User: ${snapshot.data!.studentsFound}',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp),
                            ),
                          ],
                        );
                      }
                    }),
                const Divider(
                  color: Colors.grey,
                  height: 10,
                  thickness: 2,
                ),
                Gap(5.h),
                Text(
                  'Developer Credit',
                  style:
                      TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),
                ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'Back-end: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                          //fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                      children: [
                        TextSpan(
                          text: 'Shahir Islam',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'Front-end: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                          //fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                      children: [
                        TextSpan(
                          text:
                              'Md. Shadikul Islam Shafi, Mosherof Khan, Musfika Haque',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'UI/UX: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                          //fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                      children: [
                        TextSpan(
                          text:
                              'Musfika Haque, Md. Shadikul Islam Shafi, Mosherof Khan, Shahir Islam, Azharul Islam',
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
                Gap(10.h),
                Center(
                  child: Text(
                    'Contact Developer',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14.sp,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  void _sharedPref() async {}
}
