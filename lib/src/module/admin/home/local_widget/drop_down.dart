import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:npi_project/src/data/models/DropDownModel.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:http/http.dart' as http;

class DropDown extends StatefulWidget {
  final String apiEndpoint;
  final void Function(String) onValueChanged;
  final String hintText;
  DropDown({required this.apiEndpoint, required this.onValueChanged, required this.hintText});

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<EducationSession> dropdownList = [];
  String? selectedSession; // Default selected session, null means no selection

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse(widget.apiEndpoint));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['response'] == 'success') {
          final List<dynamic> sessionsData = data['dropdownList'];
          setState(() {
            dropdownList = sessionsData.map((item) => EducationSession.fromJson(item)).toList();
          });
        }
      }
    } catch (error) {
      // Handle API error
      print('Failed to fetch data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 52.h,
        width: MediaQuery.sizeOf(context).width / 2.50,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.r)
        ),
        child:DropdownButton(
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontSize: 15.sp,
            ),
          ),
          underline: const SizedBox(),
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 16.sp,
            color: Colors.black,
          ),
          iconSize: 30,
          dropdownColor: CustomColor.blueGrey,
          elevation: 0,
          borderRadius: BorderRadius.circular(10.r),
          value: selectedSession,
          items: dropdownList.map((item) {
            return DropdownMenuItem(
              value: item.session,
              child: Text(item.session),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedSession = value as String?;
            });
            widget.onValueChanged(selectedSession!);
          },
        )
    );
  }
}