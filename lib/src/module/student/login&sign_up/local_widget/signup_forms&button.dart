import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:npi_project/src/data/global_widget/custom_button.dart';
import 'package:npi_project/src/data/utils/custom_color.dart';
import 'package:npi_project/src/data/utils/toast.dart';
import 'package:npi_project/src/module/student/login&sign_up/local_widget/input_form.dart';



class RegisterFormsAndButton extends StatefulWidget {
  const RegisterFormsAndButton({super.key});

  @override
  State<RegisterFormsAndButton> createState() => _RegisterFormsAndButtonState();
}

class _RegisterFormsAndButtonState extends State<RegisterFormsAndButton> {

  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final rollController = TextEditingController();
  final registrationController = TextEditingController();
  final technologyController = TextEditingController();
  final sessionController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _psecure = true, _cpSecure = true;
  bool loading = false;

  // FirebaseAuth _auth = FirebaseAuth.instance;

  void passwordIsSecure (){
    _psecure = !_psecure;
  }
  void cPasswordIsSecure (){
    _cpSecure = !_cpSecure;
  }

  // void register() async {
  //   try {
  //     UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text.toString(),
  //         password: passwordController.text.toString()
  //     );
  //     setState(() {
  //       loading = false ;
  //     });
  //     Utils().toastMessage('Successfully registered', Colors.green);
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(builder: (context)=> const LogIn()), (route) => false);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       Utils().toastMessage('${e.message}', Colors.red);
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //       Utils().toastMessage('${e.message}', Colors.red);
  //     }
  //     setState(() {
  //       loading = false ;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }


  @override
  void dispose() {
    usernameController.dispose();
    rollController.dispose();
    registrationController.dispose();
    technologyController.dispose();
    sessionController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InputField(
              //fieldTitle: 'Username',
              hintText: 'Enter your name',
              errorText: 'Enter name',
              obsecureText: false,
              controller: usernameController
          ),
          Gap(10.h),
          InputField(
              //fieldTitle: 'Email',
              hintText: 'Enter your Roll',
              errorText: 'Enter roll',
              obsecureText: false,
              controller: rollController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your Registration',
              errorText: 'Enter registration',
              obsecureText: false,
              controller: registrationController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your technology (CMT)',
              errorText: 'Enter roll',
              obsecureText: false,
              controller: technologyController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Email',
              hintText: 'Enter your session (18-19)',
              errorText: 'Enter roll',
              obsecureText: false,
              controller: sessionController),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Password',
            hintText: 'Enter your password',
            errorText: 'Enter password',
            obsecureText: _psecure,
            controller: passwordController,
            suffixIcon: IconButton(
              icon:Icon(_psecure? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: CustomColor.lightTeal,),
              onPressed: (){
                setState(() {
                  passwordIsSecure();
                });
              },),
          ),
          Gap(10.h),
          InputField(
            //fieldTitle: 'Password',
            hintText: 'Enter confirm password',
            errorText: 'Enter password again',
            obsecureText: _cpSecure,
            controller: confirmPasswordController,
            suffixIcon: IconButton(
              icon:Icon(_cpSecure? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: CustomColor.lightTeal),
              onPressed: (){
                setState(() {
                  cPasswordIsSecure();
                });
              },),
          ),

          CustomButton(
              buttonName: 'Register',
              loading: loading,
              onTap: ()async {
                if(_formKey.currentState!.validate()){
                  if(passwordController.text.toString().length == 6){
                    if(passwordController.text.toString() == confirmPasswordController.text.toString()){
                      // setState(() {
                      //   loading = true;
                      // });
                      // register();
                      print('working');
                    } else {
                      return Utils().toastMessage("Password didn't match", Colors.red);
                    }
                  }else{
                    return Utils().toastMessage("Less than 6 character", Colors.red);
                  }
                }
              }
          )
        ],
      ),
    );
  }
}
