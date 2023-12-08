// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:npi_project/src/controller/api_end_points.dart';
// import 'package:npi_project/src/controller/get_student_data.dart';
// import 'package:npi_project/src/module/admin/home/local_widget/custom_button.dart';
// import 'package:npi_project/src/module/admin/home/local_widget/drop_down.dart';
//
// class TestFilter extends StatelessWidget {
//   const TestFilter({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     String? selectedTechnology = '', selectedSession = '';
//     GetStudentsData getStudentsData = GetStudentsData();
//
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//       Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         DropDown(
//             apiEndpoint: ApiEndPoints.technologyList,
//             onValueChanged: (selectedId){
//
//                 if(selectedId == 'Select Technology'){
//                   selectedTechnology = '';
//                 }else {
//                   selectedTechnology = selectedId;
//                 }
//             },
//             hintText: 'select technology'
//         ),
//         //Gap(5.w),
//         DropDown(
//             apiEndpoint: ApiEndPoints.sessionList,
//             onValueChanged: (selectedId){
//                 if(selectedId == 'Select Session'){
//                   selectedSession = '';
//                 }else {
//                   selectedSession = selectedId;
//                 }
//             },
//             hintText: 'select session'
//         )
//       ],
//     ),
//         Gap(18.h),
//         CustomButton(
//           onTap: (){
//             GetStudentsData().getFilteredData('$selectedTechnology', '$selectedSession');
//           },
//         ),
//         Gap(18.h),
//         FutureBuilder(
//             future: GetStudentsData().getFilteredData('$selectedTechnology', '$selectedSession'),
//             builder: (context, snapshot){
//               return Center(
//                 child: Text('${snapshot.data!.response}'),
//               );
//             }
//         )
//     ]
//     );
//   }
// }
