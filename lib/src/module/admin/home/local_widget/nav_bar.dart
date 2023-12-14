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
      padding: const EdgeInsets.all(10),
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
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminLogInScreen()));
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

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                    future: GetStudentsData().getFilteredData('', '', ''),
                    builder: (_, snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting){
                        return LoadingAnimationWidget.waveDots(
                            color: CustomColor.deepOrange,
                            size: 30
                        );
                      }else{
                        return Text(
                            'Verified User: ${snapshot.data!.studentsFound}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w700,
                            fontSize: 15.sp
                          ),
                        );
                      }
                    }
                ),
                Gap(5.h),
                Text('Credit:', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp),),
                RichText(
                  text: TextSpan(
                      text: 'Back-end: ',
                      style: TextStyle(
                          color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp
                      ),
                      children: [
                        TextSpan(
                            text: 'Shahir Islam',
                          style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.normal),
                        )]), ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'Front-end: ',
                      style: TextStyle(
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Md. Shadikul Islam Shafi, Mosherof Khan, Musfika Haque'
                        )]), ),
                Gap(5.h),
                RichText(
                  text: TextSpan(
                      text: 'UI/UX: ',
                      style: TextStyle(
                          color: Colors.black),
                      children: [
                        TextSpan(
                            text: 'Musfika Haque, Md. Shadikul Islam Shafi, Mosherof Khan, Shahir Islam, Azharul Islam'
                        )]), )
              ],
            ),

            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Credit: '),
            //     Table(
            //       border: TableBorder.all(),
            //       columnWidths: const <int, TableColumnWidth>{
            //         0: IntrinsicColumnWidth(),
            //         1: FlexColumnWidth(),
            //         //2: FixedColumnWidth(64),
            //       },
            //       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            //       children: [
            //         TableRow(
            //           children: [
            //             TableCell(
            //               verticalAlignment: TableCellVerticalAlignment.middle,
            //               child: Container(
            //                 height: 32,
            //                 alignment: Alignment.center,
            //                 child: Text(" Back-end "),
            //               ),
            //             ),
            //             Text(' Sahir Islam')
            //           ],
            //         ),
            //         TableRow(
            //           children: [
            //             TableCell(
            //               verticalAlignment: TableCellVerticalAlignment.middle,
            //               child: Container(
            //                 height: 32,
            //                 alignment: Alignment.center,
            //                 child: Text(" Front-end "),
            //               ),
            //             ),
            //             Text(' Md. Shadikul Islam Shafi, Mosherof Khan, Musfika Haque',)
            //           ],
            //         ),
            //         TableRow(
            //           children: [
            //             TableCell(
            //               verticalAlignment: TableCellVerticalAlignment.middle,
            //               child: Container(
            //                 height: 32,
            //                 alignment: Alignment.center,
            //                 child: Text(" UI/UX "),
            //               ),
            //             ),
            //             Text(' Musfika Haque, Md. Shadikul Islam Shafi, Mosherof Khan, Shahir Islam, Azharul Islam ')
            //           ],
            //         ),
            //       ],
            //     ),
            //   Gap(10.h),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       FutureBuilder(
            //                 future: GetStudentsData().getFilteredData('', '', ''),
            //                 builder: (_, snapshot){
            //                   if(snapshot.connectionState == ConnectionState.waiting){
            //                     return LoadingAnimationWidget.waveDots(
            //                         color: CustomColor.deepOrange,
            //                         size: 30
            //                     );
            //                   }else{
            //                     return Text(
            //                         'Verified User: ${snapshot.data!.studentsFound}',
            //                       style: TextStyle(
            //                         fontFamily: 'Roboto',
            //                         fontWeight: FontWeight.w700,
            //                         fontSize: 15.sp
            //                       ),
            //                     );
            //                   }
            //                 }
            //             ),
            //     ],
            //   ),
            //   ],
            // )
          )
        ],
      ),
    ));
  }
}
