import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/data_text.dart';
import 'package:npi_project/src/data/global_widget/underline.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class PersonalInfoCard extends StatelessWidget {
  final String privetKey ;
  const PersonalInfoCard({required this.privetKey,super.key});

  @override
  Widget build(BuildContext context) {
    final userData = UserData();
    return FutureBuilder(
      future: userData.personalInfo(privetKey),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
                color: CustomColor.lightTeal,
                size: 50),
          );
        }else {
          return Card(
            color: CustomColor.lightTeal.withOpacity(0.1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
            elevation: 0,
            child: ExpansionTile(
              tilePadding: EdgeInsets.all(10.w),
              leading: CircleAvatar(
                backgroundColor: CustomColor.lightTeal.withOpacity(.5),
                backgroundImage: const AssetImage('assets/images/profile.png'),

              ),
              title: Text(
                'Personal Info',
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: 'Roboto',
                    color: CustomColor.blueGrey
                ),
              ),
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DataText(
                        dataTitle: 'Name',
                        userData: '${snapshot.data!.personalData!.name}',
                      ),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Father Name',
                          userData: '${snapshot.data!.personalData!.fatherName}'
                      ),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Mother Name',
                          userData: '${snapshot.data!.personalData!.motherName}'),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Present Address',
                          userData: '${snapshot.data!.personalData!.presentAddress}'),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Permanent Address',
                          userData: '${snapshot.data!.personalData!.permanentAddress}'),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Contact Number',
                          userData: '${snapshot.data!.personalData!.contactNumber}'),
                      const UnderLine(),
                      DataText(
                          dataTitle: 'Email',
                          userData: '${snapshot.data!.personalData!.emailAddress}'),
                      const UnderLine(),
                    ],
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}