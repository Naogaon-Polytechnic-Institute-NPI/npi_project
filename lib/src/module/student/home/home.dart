import 'package:flutter/material.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/home_localwidget/circular_percent_indicoator.dart';
import 'package:npi_project/src/module/student/home/home_localwidget/common_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const UserName(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5, right: 8),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      // border: Border.all(color: CustomColor.lightTeal),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            spreadRadius: 4,
                            offset: Offset(5, 5))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CircularIndicator(),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/edit .png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Card(
                  elevation: 7,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                    ),
                    title: Text(
                      'Personal Info',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    children: [
                      Text("my name is mosharof kahn"),
                    ],
                  ),
                ),
                const Card(
                  elevation: 7,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(
                          "assets/images/student-with-graduation-cap.png"),
                    ),
                    title: Text(
                      'Education Info',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    children: [
                      Text("my name is mosharof kahn"),
                    ],
                  ),
                ),
                const Card(
                  elevation: 7,
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.all(10),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage:
                          AssetImage("assets/images/businessman.png"),
                    ),
                    title: Text(
                      'Occupation Info',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    children: [
                      Text("my name is mosharof kahn"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
