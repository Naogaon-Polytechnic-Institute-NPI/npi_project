import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:npi_project/src/controller/api_end_points.dart';
import 'package:npi_project/src/controller/get_student_data.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/admin/home/local_widget/drop_down.dart';
import 'package:npi_project/src/module/admin/home/view/detaild_screen.dart';


class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  String? selectedTechnology = '', selectedSession = '';
  TextEditingController searchController = TextEditingController();
  GetStudentsData getStudentsData = GetStudentsData();
  String hintTextTechnology = 'Select Technology', hintTextSession = 'Select Session';




  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SearchBar(
          hintText: 'Search with roll..',
          hintStyle: MaterialStateProperty.all(const TextStyle(color: Colors.grey)),
          controller: searchController,
          elevation: const MaterialStatePropertyAll(0),
          side: MaterialStatePropertyAll<BorderSide>(BorderSide(color: Colors.black)),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: (){
            setState(() {
              selectedTechnology = '';
              selectedSession = '';
            });
          },
          onChanged: (_) {
            setState(() {
              selectedTechnology = '';
              selectedSession = '';
              searchController.text.toString();
            });
          },

          leading: const Icon(Icons.search, color: Colors.black,),
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropDown(
                apiEndpoint: ApiEndPoints.technologyList,
                onValueChanged: (selectedId){
                  if(searchController.text.length >=2){
                    setState(() {
                      selectedTechnology = '';
                    });
                  }
                  setState(() {
                    searchController.text = '';
                    if(selectedId == 'Select Technology'){
                      selectedTechnology = '';
                    }else {
                      selectedTechnology = selectedId;
                    }
                  });
                },
                hintText: hintTextTechnology
            ),

            DropDown(
                apiEndpoint: ApiEndPoints.sessionList,
                onValueChanged: (selectedId){
                  setState(() {
                    searchController.text = '';
                    if(selectedId == 'Select Session'){
                      selectedSession = '';
                    }else {
                      selectedSession = selectedId;
                    }
                  });
                },
                hintText: hintTextSession
            )
          ],
        ),
        Gap(18.h),


        FutureBuilder(
          future: getStudentsData.getFilteredData('$selectedTechnology', '$selectedSession', searchController.text),
          builder: (context, snapshot) {
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
            } else if (snapshot.connectionState == ConnectionState.done) {
              if(snapshot.data!.response == 'No Students Found from $selectedTechnology technology.'){
                return Text('No Students Found from $selectedTechnology technology.');
              }else if(snapshot.data!.response == 'No Students Found from $selectedSession Session'){
                return Text('No Students Found from $selectedSession Session');
              }else if(snapshot.data!.response == 'No Students Found !'){
                return Text('No Students Found from $selectedTechnology technology and $selectedSession Session');
              }else if(snapshot.data!.response == 'No Students Found'){
                return Text('No Students Found for ${searchController.text}');
              }else {
                return Container(
                  height: 450.h,
                  child: ListView.builder(
                    //shrinkWrap: true,
                    //physics: ScrollPhysics(),
                    itemCount: snapshot.data!.students!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: CustomColor.deepOrange.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        elevation: 0,
                        child: InkWell(
                          onTap: () =>
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetaildScreen(
                                        privetKey: snapshot.data!.students![index]
                                            .privateId.toString(),
                                      ),
                                ),
                              ),
                          child: ListTile(
                            leading: const Icon(
                              Icons.account_circle, color: Colors.black,
                              size: 40,),
                            title: Text(
                              snapshot.data!.students![index].name.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data!.students![index].roll.toString(),
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                color: Colors.black.withOpacity(.7),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              }else{
              return Text('error');
            }
            }
        )
      ],
    );
  }
}
