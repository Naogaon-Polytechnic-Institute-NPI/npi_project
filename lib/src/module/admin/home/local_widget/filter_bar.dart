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

        FutureBuilder(
            future: getStudentsData.getFilteredData(selectedTechnology.toString(), selectedSession.toString()),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
                return LoadingAnimationWidget.staggeredDotsWave(
                    color: CustomColor.deepOrange,
                    size: 50
                );
              }else if(snapshot.hasData == null){
                return const Text('no data');
              }else if(snapshot.data!.response == 'No Students Found !'){
                return Text('No student found');
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.students.length,
                    itemBuilder: (context, index){
                    return Text('index');
                });
              }
            })
      ],
    );
  }
}
