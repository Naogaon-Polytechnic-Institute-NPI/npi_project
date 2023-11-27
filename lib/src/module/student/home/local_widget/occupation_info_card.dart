import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/global_widget/data_text.dart';
import 'package:npi_project/src/data/global_widget/underline.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class OccupationInfoCard extends StatelessWidget {
  final String privetKey;
  const OccupationInfoCard({required this.privetKey,super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: UserData().occupationInfo(privetKey),
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
                  backgroundImage: const AssetImage('assets/images/businessman.png'),

                ),
                title:Text(
                  'Occupation Info',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: 'Roboto',
                      color: CustomColor.blueGrey
                  ),
                ),
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        DataText(
                            dataTitle: 'Current Occupation',
                            userData: '${snapshot.data!.occupationInfo!.currnetOccupation}'),
                        const UnderLine(),
                        DataText(
                            height: 100.h,
                            dataTitle: 'Occupation Details',
                            userData: '${snapshot.data!.occupationInfo!.occupationDetails}'),
                        const UnderLine(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        }
    );
  }
}