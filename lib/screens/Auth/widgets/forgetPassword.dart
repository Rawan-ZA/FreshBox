import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/Auth/widgets/reset_dialog.dart';
import 'package:gittest/screens/Auth/widgets/textform_field_widgte.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';



class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  late TextEditingController emailController;
  Widget? errorHint;
  bool isActive = false;
  final keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    emailController.addListener(() {
      setState(() {
        isActive = emailController.text.isNotEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:  Padding(
        padding: EdgeInsets.all(20).r,
        child: Column(
          spacing: 15.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Password Recovery",
            style: TextStyle(
              color: Color(0xff313131),
              fontSize: 19.sp,
              fontFamily: "Montserrat-Light",
              fontWeight: FontWeight.w500
            ),),
            Text("Enter your email for the verification proccess, we will send you link to Reset your Password.",
              style: TextStyle(
                  color: Color(0xff616161),
                  fontSize: 15.sp,
                  fontFamily: "Montserrat-Light",
                  fontWeight: FontWeight.w300
              ),),
            Form(
              key: keyForm,
              child: Column(
                spacing: 15.h,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "E-mail Id",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  SizedBox(
                    width: 296.w,
                    height: 70.h,
                    child:textform_field_widget(emailController: emailController,
                      errorHint: errorHint,value: "Enter your E-mail",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is empty";
                        } else if (!value.contains("@")) {
                          return "Email is not correct";
                        }
                        return null;
                      }, outlainBorderRadius: 12.0,filled: true,
                      filledColor: Color(0xffF5F5F8),),
                  ),
                  SizedBox(
                    height: 45.h,
                      width: 296.w,
                      child: elevatedbtnwidget(text: "Continue",
                        onPressed: () {
                        if (keyForm.currentState!.validate()) {
                          print(emailController.text);
                          showDialog(context: context, builder: (context) {
                            return reset_dialog();},);
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                      }},
                        bgColor: isActive ? Color(0xffEB6A58) :
                      Color(0xffD1CFD5),)
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
