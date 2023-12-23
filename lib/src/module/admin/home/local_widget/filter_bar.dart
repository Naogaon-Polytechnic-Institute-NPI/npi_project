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
  static const List<String> shiftOption = ['Select Shift', '1st', '2nd'];
  String? selectedTechnology = '', selectedSession = '', selectedShift = shiftOption.first, shift = '';
  TextEditingController searchController = TextEditingController();
  GetStudentsData getStudentsData = GetStudentsData();





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
          side: const MaterialStatePropertyAll<BorderSide>(BorderSide(color: Colors.black)),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          // onTap: (){
          //   setState(() {
          //     selectedTechnology = '';
          //     selectedSession = '';
          //   });
          // },
          onChanged: (_) {
            setState(() {
              selectedTechnology = '';
              selectedSession = '';
              shift = '';
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
                hintText: 'Select Technology'
            ),

            Container(
                alignment: Alignment.center,
                height: 52.h,
                width: MediaQuery.sizeOf(context).width / 3.40,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(5.r)
                ),
                child:DropdownButton(
                  isExpanded: true,
                  underline: const SizedBox(),
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                  iconSize: 25,
                  dropdownColor: CustomColor.blueGrey,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10.r),
                  value: selectedShift,
                  items: shiftOption.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedShift = value.toString();
                      searchController.text = '';
                      if(value == 'Select Shift'){
                        shift = '';
                      }else {
                        shift = value;
                      }
                      print(value);
                      print(shift);
                    });
                  },
                )
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
                hintText: 'Select Session'
            )
          ],
        ),
        Gap(10.h),

        Gap(18.h),


        FutureBuilder(
            future: getStudentsData.getFilteredData('$selectedTechnology', '$selectedSession', searchController.text, shift),
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
                }else if(snapshot.data!.response == 'No Students Found from $selectedSession Session.'){
                  return Text('No Students Found from $selectedSession Session.');
                }else if(snapshot.data!.response == 'No Students Found from $selectedTechnology Technology $selectedSession Session.'){
                  return Text('No Students Found from $selectedTechnology technology and $selectedSession Session.');
                }else if(snapshot.data!.response == 'No students found with ${searchController.text} Roll.'){
                  return Text('No students found with ${searchController.text} Roll.');
                }else if(snapshot.data!.response == 'No Students Found from $shift Shift of $selectedTechnology Technology.'){
                  return Text('No Students Found from $shift Shift of $selectedTechnology Technology.');
                }else if(snapshot.data!.response == 'No Students Found !'){
                  return Text('No Students Found from $shift Shift of $selectedTechnology Technology and $selectedSession session.');
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
                              leading: CircleAvatar(
                                minRadius: 25.h,
                                maxRadius: 30.w,
                                backgroundColor: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('${snapshot.data!.students![index].technology}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),),
                                    Text('${snapshot.data!.students![index].shift}', style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                              ),
                              title: Text(
                                snapshot.data!.students![index].name.toString(),
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                '${snapshot.data!.students![index].roll.toString()} (${snapshot.data!.students![index].session})',
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
