// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/get_student_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/login/view/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  final String userName, email;
  const NavBar({
    required this.userName,
    required this.email,
    super.key});

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
                          backgroundImage: AssetImage('assets/images/npi_logo.png')),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                          userName,
                          style: TextStyle(
                              fontSize: 18.sp,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(email)
                    ],
                  ),
          )),
          Padding(
                  padding: const EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () async {
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.clear();
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                            builder: (context)=> const AdminLogInScreen()), (route) => false);
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
                    builder: (_, snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return LoadingAnimationWidget.waveDots(
                            color: CustomColor.deepOrange,
                            size: 30
                        );
                      }else if(snapshot.connectionState == ConnectionState.done){
                        return Row(
                          children: [
                            Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(100)
                              ),
                            ),
                            Gap(5.w),
                            Text(
                                'Total User: ${snapshot.data!.studentsFound}',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                fontSize: 15.sp
                              ),
                            ),
                          ],
                        );
                      }else{
                        throw Exception(Text('$Exception'));
                      }
                    }
                ),
                const Divider(color: Colors.grey, height: 10, thickness: 2,),
                Gap(5.h),
                Text('Developer Credit', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'Back-end: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                        //fontWeight: FontWeight.w500,
                        fontSize: 13.sp
                      ),
                      children: [
                        TextSpan(
                            text: 'Shahir Islam',
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )]), ),
                Gap(5.h),
                RichText(
                  text:  TextSpan(
                      text: 'Front-end: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                          //fontWeight: FontWeight.w500,
                          fontSize: 13.sp
                      ),
                      children: [
                        TextSpan(
                            text: 'Md. Shadikul Islam Shafi, Mosherof Khan, Musfika Haque',
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )]), ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'UI/UX: ',
                      style: TextStyle(
                          color: const Color(0xff686868),
                          //fontWeight: FontWeight.w500,
                          fontSize: 13.sp
                      ),
                      children: [
                        TextSpan(
                            text: 'Musfika Haque, Md. Shadikul Islam Shafi, Mosherof Khan, Shahir Islam, Azharul Islam',
                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
                        )]), ),
                Gap(10.h),
                Center(
                  child: Text('Contact Developer',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.sp,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700
                    ),),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
