import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/home/local_widget/filter_bar.dart';
import 'package:npi_project/src/module/admin/home/local_widget/nav_bar.dart';
import 'package:npi_project/src/module/admin/home/local_widget/search_bar.dart';
import 'package:npi_project/src/module/admin/home/local_widget/test_filter.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        key: _globalKey,
        drawer: const NavBar(
            userName: 'userName',
            roll: 'roll'
        ),
        body: Container(
          padding: EdgeInsets.all(24.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
                              color: CustomColor.deepOrange.withOpacity(.8)
                          )),
                    )
                  ],
                ),
                const SearchBarApp(),
                Gap(8.h),
                const FilterBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
