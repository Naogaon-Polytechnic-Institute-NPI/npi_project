import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/global_widget/txt_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/module/student/home/view/home.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';

class LoginFormsAndButton extends StatefulWidget {
  const LoginFormsAndButton({super.key});

  @override
  State<LoginFormsAndButton> createState() => _LoginFormsAndButtonState();
}

class _LoginFormsAndButtonState extends State<LoginFormsAndButton> {
  final _formKey = GlobalKey<FormState>();
  final rollController = TextEditingController();
  final passwordController = TextEditingController();
  bool _psecure = true;
  bool _loading = false;

  void passwordIsSecure() {
    _psecure = !_psecure;
  }

  void logIn(){
    try{
      Response response =
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputField(
              //fieldTitle: 'Email',
              hintText: 'Enter your Roll',
              errorText: 'Enter Roll',
              obsecureText: false,
              controller: rollController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Password',
            hintText: 'Enter your password',
            errorText: 'Enter password',
            obsecureText: _psecure,
            controller: passwordController,
            suffixIcon: IconButton(
              icon: Icon(
                _psecure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined,
                color: CustomColor.lightTeal,
              ),
              onPressed: () {
                setState(() {
                  passwordIsSecure();
                });
              },
            ),
          ),
          TxtButton(
            onTap: () {
              //Navigator.push(context, MaterialPageRoute(builder: (context)=> EnterEmail()));
              print('Working');
            },
            buttonName: 'Forgot password?',
            fontSize: 13.sp,
            color: CustomColor.blueGrey,
          ),
          CustomButton(
              loading: _loading,
              buttonName: 'Login',
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  // setState(() {
                  //   _loading = true ;
                  // });
                  // login();
                  print('working');
                  print(rollController.text.toString());
                  print(passwordController.text.toString());
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                }
              })
        ],
      ),
    );
  }
}
