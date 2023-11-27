import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/data_text.dart';
import 'package:npi_project/src/data/global_widget/underline.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class EducationInfoCard extends StatelessWidget {
  final String privetKey;
  const EducationInfoCard({required this.privetKey,super.key});

  @override
  Widget build(BuildContext context) {
    final userData = UserData();
    return FutureBuilder(
      future: userData.educationInfo(privetKey),
      builder: (context, snapshot) {
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
            backgroundImage: const AssetImage(
                'assets/images/student-with-graduation-cap.png'),

          ),
          title: Text(
            'Education Info',
            style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'Roboto',
                color: CustomColor.blueGrey
            ),
          ),
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.response!.length,
                itemBuilder: (context, index) {
                  return Card(
                      color: CustomColor.lightTeal.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.all(10.w),
                        leading: CircleAvatar(
                          backgroundColor: CustomColor.lightTeal.withOpacity(
                              .5),
                          backgroundImage: const AssetImage(
                              'assets/images/student-with-graduation-cap.png'),

                        ),
                        title: Text(
                          '${snapshot.data!.response?[index].instituteName}',
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: 'Roboto',
                              color: CustomColor.blueGrey
                          ),
                        ),
                        children: [
                          SizedBox(
                            width: MediaQuery
                                .sizeOf(context)
                                .width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DataText(
                                    dataTitle: 'Course Name',
                                    userData: '${snapshot.data!.response![index]
                                        .studying}'),
                                const UnderLine(),
                                DataText(
                                    dataTitle: 'Subject Name',
                                    userData: '${snapshot.data!.response![index]
                                        .subjectName}'),
                                const UnderLine(),
                                DataText(
                                    dataTitle: 'Passing Year',
                                    userData: '${snapshot.data!.response![index]
                                        .passingYear}'),
                                const UnderLine(),
                              ],
                            ),
                          ),
                        ],
                      )
                  );
                }
            )
          ],
        ),
      );
    }
      }
    );
  }
}
