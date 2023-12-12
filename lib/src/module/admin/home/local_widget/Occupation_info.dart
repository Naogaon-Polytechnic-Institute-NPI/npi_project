// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/global_widget/info_input_field.dart';

class OccupationInfo extends StatefulWidget {
  final String privetKey;

  const OccupationInfo({
    //required this.userName,
    required this.privetKey,
    super.key});

  @override
  State<OccupationInfo> createState() => OccupationInfoState();
}

class OccupationInfoState extends State<OccupationInfo> {
  final UserData _userData = UserData();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Occupational Data',
          style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
              fontSize: 18.sp
          ),
        ),
        const Divider(
          color: Colors.blueGrey,
          thickness: 2,
        ),
        FutureBuilder(
            future: _userData.occupationInfo(widget.privetKey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: CustomColor.deepOrange,
                      size: 50
                  ),
                );
              }else if(snapshot.connectionState == ConnectionState.done) {
                if(snapshot.data!.response == 'No Data Found'){
                  return Text('No Data Found');
                }else {
                  return Column(
                      children: [
                        InfoInputForm(
                          title: 'Current Occupation',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'No Data Found',
                          notEditable: true,
                          errorText: '',
                          initialValue: snapshot.data!.occupatioInfo!
                              .currnetOccupation,
                        ),
                        Gap(10.h),
                        InfoInputForm(
                          title: 'Occupation Details',
                          fieldHeight: 50.h,
                          fieldWidth: width,
                          hintText: 'No Data Found',
                          notEditable: true,
                          errorText: '',
                          initialValue: snapshot.data!.occupatioInfo!
                              .occupationDetails,
                        ),
                      ]
                  );
                }
              }else{
                throw Exception('$Exception');
              }

            }
        )
      ],
    );
  }
}
