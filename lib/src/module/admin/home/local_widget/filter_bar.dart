import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/get_student_data.dart';
import 'package:npi_project/src/data/models/AdminViewStudent.dart';
import 'package:npi_project/src/data/models/TestView.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/home/local_widget/custom_button.dart';
import 'package:npi_project/src/module/admin/home/local_widget/drop_down.dart';
import 'package:npi_project/src/module/admin/home/view/detaild_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  String? selectedTechnology = '', selectedSession = '';
  GetStudentsData getStudentsData = GetStudentsData();
  SharedPreferences? sharedPreferences;



  Future<void> getData() async {
    try {
      sharedPreferences = await SharedPreferences.getInstance();
      //AdminViewStudent adminViewStudent = await GetStudentsData().getFilteredData(selectedTechnology!, selectedSession!);
      sharedPreferences!.setStringList('filterResponse', '${GetStudentsData().getFilteredData(selectedTechnology!, selectedSession!)}' as List<String>);
      //sharedPreferences.setString('roll', '${adminViewStudent.students![index].roll}');
      // sharedPreferences.setString('name', '${adminViewStudent.students![index].name}');
      // sharedPreferences.setString('name', '${adminViewStudent.students![index].name}');
      // sharedPreferences.setString('name', '${adminViewStudent.students![index].name}');
    } catch (e) {
      //Utils().toastMessage('Error', Colors.red);
      print('Error fetching data: $e');
    }
  }

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDown(
                apiEndpoint: ApiEndPoints.technologyList,
                onValueChanged: (selectedId){
                  setState(() {
                    if(selectedId == 'Select Technology'){
                      selectedTechnology = '';
                    }else {
                      selectedTechnology = selectedId;
                    }
                  });
                },
                hintText: 'select technology'
            ),
            //Gap(5.w),
            DropDown(
                apiEndpoint: ApiEndPoints.sessionList,
                onValueChanged: (selectedId){
                  setState(() {
                    if(selectedId == 'Select Session'){
                      selectedSession = '';
                    }else {
                      selectedSession = selectedId;
                    }
                  });
                },
                hintText: 'select session'
            )
          ],
        ),
        Gap(18.h),
        // CustomButton(
        //   onTap: (){
        //     getData();
        //   },
        // ),
        //       Gap(20.h),
        //
        //       Text('${sharedPreferences!.getString('filterResponse')}' ?? '')
              // ListView.builder(
              //   shrinkWrap: true,
              //   String test = sharedPreferences.getString('filterResponse' ?? '')
              //   itemCount: ,
              //   itemBuilder: (context, index) {
              //     print(getStudentsData.apiResponse["students"]);
              //     //print('hi ${snapshot.data!.students!.length}');
              //     return Card(
              //       color: CustomColor.deepOrange.withOpacity(0.2),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.r),
              //       ),
              //       elevation: 0,
              //       child: InkWell(
              //         onTap: () => Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => DetaildScreen(
              //               privetKey: '${getStudentsData.apiResponse["students"][index]["private_id"]}' ?? '',
              //             ),
              //           ),
              //         ),
              //         child: ListTile(
              //           leading: const Icon(Icons.account_circle, color: Colors.grey, size: 40,),
              //           title: Text(
              //             '${getStudentsData.apiResponse["students"][index]["name"]}' ?? '',
              //             style: TextStyle(
              //               fontFamily: 'Roboto',
              //               fontWeight: FontWeight.w500,
              //               fontSize: 16.sp,
              //               color: CustomColor.lightTeal,
              //             ),
              //           ),
              //           subtitle: Text(
              //             '${getStudentsData.apiResponse["students"][index]["roll"]}' ?? '',
              //             style: const TextStyle(
              //               fontFamily: 'Roboto',
              //               color: CustomColor.blueGrey,
              //             ),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // )

        FutureBuilder<AdminView>(
          key: listKey,
          future: getStudentsData.getFilteredData('$selectedTechnology', '$selectedSession'),
          builder: (context, snapshot) {

            print('API Response: ${snapshot.data}');
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: CustomColor.deepOrange,
                  size: 50,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error fetching data: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              var adminView = snapshot.data as AdminView;
              print('Students list length: ${adminView.students?.length}');
              print('Type of first element: ${adminView.students!.isNotEmpty ? adminView.students![0].runtimeType : 'No elements'}');
              print('API Response: $adminView');
              print('response: ${adminView.response}');
              print('hi ${adminView.studentsFound}');
              print('Students list: ${adminView.students}');

              if (adminView.students != null && adminView.students!.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: adminView.students!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: CustomColor.deepOrange.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                      child: InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetaildScreen(
                              privetKey: '${adminView.students![index].privateId}',
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.account_circle, color: Colors.grey, size: 40,),
                          title: Text(
                            '${adminView.students![index].name}',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: CustomColor.lightTeal,
                            ),
                          ),
                          subtitle: Text(
                            '${adminView.students![index].roll}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              color: CustomColor.blueGrey,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No Student found'),
                );
              }
            } else {
              return const Center(
                child: Text('No data here'),
              );
            }
          },
        )

      ],
    );
  }
}
