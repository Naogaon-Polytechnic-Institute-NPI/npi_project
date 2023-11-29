import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/data_text.dart';
import 'package:npi_project/src/data/global_widget/underline.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/local_widget/input_educational_info.dart';
import 'package:npi_project/src/module/student/home/local_widget/input_personal_info.dart';

class EducationInfoCard extends StatefulWidget {
  final String privetKey;
  const EducationInfoCard({required this.privetKey, super.key});

  @override
  State<EducationInfoCard> createState() => _EducationInfoCardState();
}

class _EducationInfoCardState extends State<EducationInfoCard> {
  @override
  Widget build(BuildContext context) {
    final userData = UserData();
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
          backgroundImage:
              const AssetImage('assets/images/student-with-graduation-cap.png'),
        ),
        title: Text(
          'Education Info',
          style: TextStyle(
              fontSize: 20.sp,
              fontFamily: 'Roboto',
              color: CustomColor.blueGrey),
        ),
        trailing: InkWell(
          onTap: () => showModalBottomSheet<void>(
            showDragHandle: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(17.r))),
            context: context,
            builder: (BuildContext context) {
              return InputEducationalInfo(
                privetKey: widget.privetKey,
              );
            },
          ),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.edit_rounded,
              color: CustomColor.lightTeal,
            ),
          ),
        ),
        children: [
          FutureBuilder(
              future: userData.educationInfo(widget.privetKey),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: CustomColor.lightTeal, size: 50),
                  );
                } else if (snapshot.data!.response == 'No Data Found !') {
                  return Center(
                    child: Text(
                      'No data found',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Roboto',
                          color: CustomColor.blueGrey),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    // child: Text(
                    //   'No data found',
                    //   style: TextStyle(
                    //     fontSize: 16.sp,
                    //     fontFamily: 'Roboto',
                    //     color: CustomColor.blueGrey
                    //   ),),
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: CustomColor.lightTeal, size: 50),
                  );
                } else {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.educationalInfo!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: CustomColor.lightTeal.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            elevation: 0,
                            child: ExpansionTile(
                              tilePadding: EdgeInsets.all(10.w),
                              leading: const CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage(
                                    'assets/images/student-with-graduation-cap.png'),
                              ),
                              title: Text(
                                '${snapshot.data!.educationalInfo![index].instituteName}',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontFamily: 'Roboto',
                                    color: CustomColor.blueGrey),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    userData.deleteApi(
                                        '${snapshot.data!.educationalInfo![index].postId}');
                                  });
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.delete,
                                    color: CustomColor.lightTeal,
                                  ),
                                ),
                              ),
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      DataText(
                                          dataTitle: 'Course Name',
                                          userData:
                                              '${snapshot.data!.educationalInfo![index].studying}'),
                                      const UnderLine(),
                                      DataText(
                                          dataTitle: 'Subject Name',
                                          userData:
                                              '${snapshot.data!.educationalInfo![index].subjectName}'),
                                      const UnderLine(),
                                      DataText(
                                          dataTitle: 'Passing Year',
                                          userData:
                                              '${snapshot.data!.educationalInfo![index].passingYear}'),
                                      const UnderLine(),
                                    ],
                                  ),
                                ),
                              ],
                            ));
                      });
                }
              })
        ],
      ),
    );
  }
}
