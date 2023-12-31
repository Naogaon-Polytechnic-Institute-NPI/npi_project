import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/local_widget/educataion_Info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/greeting.dart';
import 'package:npi_project/src/module/student/home/local_widget/nav_bar.dart';
import 'package:npi_project/src/module/student/home/local_widget/occupation_info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/personal_info_card.dart';
import 'package:npi_project/src/module/student/home/local_widget/profile_indicator_part.dart';
import 'package:npi_project/src/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String? useName, privetKey, roll;
  const HomeScreen({
    this.useName,
    this.roll,
    this.privetKey,
    super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        key: _globalKey,
        drawer: NavBar(
          userName: '${widget.useName}',
          roll: '${widget.roll}',
        ),
        body: Container(
          padding: EdgeInsets.all(24.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //     colors:[
            //       Colors.white,
            //       CustomColor.lightTeal.withOpacity(.5),
            //     ]
            // )
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        _globalKey.currentState!.openDrawer();
                      },
                      child: SizedBox(
                        height: 35.h,
                          width: 35.w,
                          child: Image.asset('assets/images/menu.png',
                            color: CustomColor.lightTeal.withOpacity(.8)
                            )),
                    )
                  ],
                ),
                Gap(10.h),
                GreetingPart(
                  userName: '${widget.useName}',
                ),
                ProfileIndicatorPart(
                  privetKey: '${widget.privetKey}',
                ),
                Gap(20.h),
                PersonalInfoCard(
                  privetKey: '${widget.privetKey}',
                  userName: '${widget.useName}',
                ),
                EducationInfoCard(
                  privetKey: '${widget.privetKey}',
                ),
                OccupationInfoCard(
                  privetKey: '${widget.privetKey}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
