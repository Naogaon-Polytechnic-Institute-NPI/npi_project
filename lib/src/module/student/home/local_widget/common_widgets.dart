import 'package:flutter/material.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                top: 3,
              ),
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: CustomColor.lightTeal),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(5, 5))
                  ]),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Greeting",
                    style: TextStyle(
                      fontSize: 18,
                      color: CustomColor.lightTeal,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/profile pic .jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomColor.lightTeal),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(5, 5))
                  ]),
              // child: Image.asset(
              //   "assets/images/profile pic .jpg",
              //   fit: BoxFit.fitWidth,
              // ),
            )),
      ],
    );
  }
}
