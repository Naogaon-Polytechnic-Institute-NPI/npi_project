// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/user_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/global_widget/info_input_field.dart';

class PersonalInfo extends StatefulWidget {
  final String privetKey;

  const PersonalInfo({
    //required this.userName,
    required this.privetKey,
    super.key});

  @override
  State<PersonalInfo> createState() => PersonalInfoState();
}

class PersonalInfoState extends State<PersonalInfo> {
  final UserData _userData = UserData();


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Personal Data',
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
            future: _userData.personalInfo(widget.privetKey),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                      color: CustomColor.deepOrange,
                      size: 50
                  ),
                );
              } else if(snapshot.connectionState == ConnectionState.done) {

                if(snapshot.data!.response == 'No Data Found !'){
                  return Text('No Data Found');
                }else {
                  return Column(
                    children: [
                      InfoInputForm(
                        title: 'Name',
                        fieldHeight: 50.h,
                        fieldWidth: width,
                        hintText: 'No Data Found',
                        notEditable: true,
                        errorText: '',
                        initialValue: snapshot.data!.personalData!.name,
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoInputForm(
                            title: 'Father Name',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            hintText: 'No Data Found',
                            errorText: 'enter father name',
                            //controller: fatherController,
                            initialValue: snapshot.data!.personalData!
                                .fatherName ?? 'No data Found',
                          ),
                          Gap(5.w),
                          InfoInputForm(
                            errorText: 'enter mother name',
                            title: 'Mother Name',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            hintText: 'No Data Found',
                            //controller: motherController,
                            initialValue: snapshot.data!.personalData!
                                .motherName ?? 'No data Found',
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoInputForm(
                            errorText: 'enter address',
                            title: 'Present address',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            hintText: 'No Data Found',
                            //controller: presentController,
                            initialValue: snapshot.data!.personalData!
                                .presentAddress ?? 'No data Found',
                          ),
                          InfoInputForm(
                            errorText: 'enter address',
                            title: 'Permanent address',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            hintText: 'No Data Found',
                            //controller: permanentController,
                            initialValue: snapshot.data!.personalData!
                                .permanentAddress ?? 'No data Found',
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoInputForm(
                            errorText: 'enter number',
                            title: 'Contact number',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            textInputType: TextInputType.number,
                            hintText: 'No Data Found',
                            //controller: contactController,
                            initialValue: snapshot.data!.personalData!
                                .contactNumber ?? 'No data Found',
                          ),
                          InfoInputForm(
                            errorText: 'enter email',
                            title: 'Email',
                            fieldHeight: 50.h,
                            fieldWidth: 161.w,
                            notEditable: true,
                            textInputType: TextInputType.emailAddress,
                            hintText: 'No Data Found',
                            // controller: emailController,
                            initialValue: snapshot.data!.personalData!
                                .emailAddress ?? 'No data Found',
                          ),
                        ],
                      ),
                    ],
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
