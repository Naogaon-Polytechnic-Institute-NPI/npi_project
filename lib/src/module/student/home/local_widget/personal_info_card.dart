import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/data_text.dart';
import 'package:npi_project/src/data/global_widget/underline.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/local_widget/input_personal_info.dart';

class PersonalInfoCard extends StatelessWidget {
  final String privetKey, userName ;
  const PersonalInfoCard({
    required this.privetKey,
    required this.userName,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColor.lightTeal.withOpacity(0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 0,
      child: ExpansionTile(
        tilePadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 0.h),
        leading: const CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/profile.png'),
        ),
        title: Text(
          'Personal Info',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Roboto',
              color: CustomColor.blueGrey
          ),
        ),

        trailing: SizedBox(
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(Icons.keyboard_arrow_down, size: 30,),
              Gap(10.w),
              InkWell(
                onTap: ()=> showModalBottomSheet<void>(
                  showDragHandle: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(17.r))),
                  context: context,
                  builder: (BuildContext context) {
                    return InputPersonalInfo(
                      userName: userName,
                      privetKey: privetKey,
                    );
                  },
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.edit_rounded, color: CustomColor.lightTeal,),
                ),
              ),
            ],
          ),
        ),
        children: [
          FutureBuilder(
              future: UserData().personalInfo(privetKey),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: CustomColor.lightTeal,
                        size: 50),
                  );
                } else if(snapshot.data!.response == 'No Data Found !'){
                  return Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Roboto',
                        color: CustomColor.blueGrey
                      )));
                }else if (snapshot.hasError) {
                  return Center(
                    // child: Text(
                    //   'No data found',
                    //   style: TextStyle(
                    //     fontSize: 16.sp,
                    //     fontFamily: 'Roboto',
                    //     color: CustomColor.blueGrey
                    //   ),),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: CustomColor.lightTeal,
                        size: 50),
                  );
                } else {
                  return SizedBox(
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
                            userData: '${snapshot.data!.personalData!
                                .motherName}'),
                        const UnderLine(),
                        DataText(
                            dataTitle: 'Present Address',
                            userData: '${snapshot.data!.personalData!
                                .presentAddress}'),
                        const UnderLine(),
                        DataText(
                            dataTitle: 'Permanent Address',
                            userData: '${snapshot.data!.personalData!
                                .permanentAddress}'),
                        const UnderLine(),
                        DataText(
                            dataTitle: 'Contact Number',
                            userData: '${snapshot.data!.personalData!
                                .contactNumber}'),
                        const UnderLine(),
                        DataText(
                            dataTitle: 'Email',
                            userData: '${snapshot.data!.personalData!
                                .emailAddress}'),
                        const UnderLine(),
                      ],
                    ),
                  );
                }
              }
          )
        ],
      ),
    );
  }
}