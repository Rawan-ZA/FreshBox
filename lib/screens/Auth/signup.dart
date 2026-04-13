import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/screens/Auth/widgets/password_reset_successful_dialog.dart';
import 'package:gittest/screens/Auth/widgets/password_set_sucessful.dart';
import 'package:gittest/screens/Auth/widgets/reset_dialog.dart';
import 'package:gittest/screens/Auth/widgets/textform_field_widgte.dart';

import '../../widgets/elevatedbtnwidget.dart';
import 'login.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  Widget? errorHint;
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;
  final keyForm = GlobalKey<FormState>();
  final keyOTP = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    otpControllers = List.generate(5, (index) => TextEditingController());
    focusNodes = List.generate(5, (index) => FocusNode());

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    for (var controllers in otpControllers) {
      controllers.dispose();
    }
    for (var nodes in focusNodes) {
      nodes.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f8),
        body: Padding(
          padding: EdgeInsets.all(20).r,
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.r),
                  child:
                  Center(
                    child: Image.asset("assets/images/mainLogo.png"),
                    ),
                  ),
                Column(
                  spacing: 5.w,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s get Started",
                      style: TextStyle(
                        color: Color(0xff111a2c),
                        fontWeight: FontWeight.bold,
                        fontSize: 24.sp,
                      ),
                    ),
                    Text(
                      "Create an account to continue!",
                      style: TextStyle(
                        color: Color(0xff6d6d6e),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 0),
                Form(
                  key: keyForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 12.w,
                    children: [
                      Text(
                        "Username ",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      SizedBox(
                        width: 450.w,
                        child: textform_field_widget(
                            filledColor: Color(0xffffffff),
                            filled: true,
                            emailController: usernameController,
                            errorHint: errorHint, validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "username  is empty";
                              } else if (value.length < 4) {
                                return "Username is short";
                              } else if (!RegExp(
                                r'^[a-zA-Z0-9_]+$',
                              ).hasMatch(value)) {
                                return "Username must contain letters, numbers,and _ only";
                              }
                              return null;
                            }, value: "Create your username ")
                        // TextFormField(
                        //   controller: ,
                        //   decoration: InputDecoration(
                        //     error: errorHint,
                        //     contentPadding: EdgeInsets.symmetric(
                        //       vertical: 15.r,
                        //       horizontal: 20.r,
                        //     ),
                        //     filled: true,
                        //     fillColor: Color(0xffffffff),
                        //     hintText: ,
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     hoverColor: Color(0xffffffff),
                        //   ),
                        //   validator:
                        // ),
                      ),
                      Text(
                        "E-mail Id",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      SizedBox(
                        width: 450.w,
                        child: textform_field_widget(
                            filledColor: Color(0xffffffff),
                            filled: true,
                            emailController: emailController,
                            errorHint: errorHint, validator:  (value) {
                              if (value == null || value.isEmpty) {
                                return "Email is empty";
                              } else if (!value.contains("@")) {
                                return "Email is not correct";
                              }
                              return null;
                            }, value: "Enter your e-mail")
                        // TextFormField(
                        //   controller: ,
                        //   decoration: InputDecoration(
                        //     error: errorHint,
                        //     contentPadding: EdgeInsets.symmetric(
                        //       vertical: 15.r,
                        //       horizontal: 20.r,
                        //     ),
                        //     filled: true,
                        //     fillColor: Color(0xffffffff),
                        //     hintText: ,
                        //     focusedBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     hoverColor: Color(0xffffffff),
                        //   ),
                        //   validator:
                        // ),
                      ),
                      Text(
                        "Password",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 17.r),
                      ),
                      SizedBox(
                        width: 450.w,
                        child: textform_field_widget(emailController: passwordController,
                            errorHint: errorHint,
                          filledColor: Color(0xffffffff),
                          filled: true,
                          validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password required";
                              } else if (value.length < 8) {
                                return "Password is weak";
                              } else if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
                                return "Must contain uppercase and lowercase letter";
                              } else {
                                return null;
                              }
                            }, value:  "Create Your Password",obscureText: true,suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xff121212),
                              size: 26.sp,
                            ),)
                        // TextFormField(
                        //   controller: ,
                        //   obscureText: true,
                        //   obscuringCharacter: '*',
                        //   decoration: InputDecoration(
                        //     error: errorHint,
                        //     focusedErrorBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //     suffixIcon:
                        //     contentPadding: EdgeInsets.symmetric(
                        //       vertical: 15.r,
                        //       horizontal: 20.r,
                        //     ),
                        //     hintText:,
                        //     filled: true,
                        //     fillColor: Color(0xffffffff),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(10).r,
                        //       borderSide: BorderSide.none,
                        //     ),
                        //
                        //   ),
                        //   validator:
                        // ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50.h,
                        child: elevatedbtnwidget(
                          text: "Signup",
                          onPressed: () {
                            if (keyForm.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              print(usernameController.text);
                              otpFunction();
                          }

                              }
                        ),
                      ),
                    ),

                  ],
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xff121212),
                      ),
                      children: [
                        TextSpan(text: "Already have an account?  "),
                        TextSpan(
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()..onTap = (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          style: TextStyle(color: Color(0xffeb6a58)),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 450.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    spacing: 8.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/google.svg",
                        width: 20.w,
                        height: 20.h,
                      ),
                      Text(
                        "Continue With Google",
                        style: TextStyle(fontSize: 14.r),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 450.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Color(0xff4267b2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    spacing: 8.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.facebook_sharp,color: Color(0xffffffff),),
                      SvgPicture.asset(
                        "assets/images/facebook.svg",
                        width: 20.w,
                        height: 20.h,
                      ),
                      Text(
                        "Continue With Facebook",
                        style: TextStyle(fontSize: 14.sp, color: Color(0xffffffff)),
                      ),
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
     otpFunction(){
       showDialog(context: context, builder: (context) {
         return Dialog(
           alignment: AlignmentGeometry.center,
           insetPadding: EdgeInsets.all(15).r,
           backgroundColor: Color(0xffffffff),
           elevation:0.5,
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(20).r,
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(20).r,
             child: SizedBox(
                 width:333.w ,
                 height: 364.h,
                 child:Padding(
                   padding: EdgeInsets.all(15).r,
                   child: Column(
                     spacing: 20.h,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text("OTP Authentication",style: TextStyle(
                        fontSize:19.sp,
                         fontWeight: FontWeight.w500,
                         fontFamily: "Montserrat-Bold"
                       ),),
                       Text("An authentication code has been sent to Gmail",
                       overflow: TextOverflow.visible,
                       maxLines: 2,
                       style: TextStyle(
                         color: Color(0xff616161),
                         fontWeight: FontWeight.w300,
                         fontSize: 15.sp,
                        fontFamily: "Montserrat-Light"
                       ),),
                       Form(
                         key: keyOTP,
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             crossAxisAlignment: CrossAxisAlignment.center,
                         children: List.generate(5, (index) => OtpWidget(index),),
                       )),
                       RichText(text: TextSpan(
                         style: TextStyle(
                            fontFamily: "Montserrat",
                           fontSize: 15.sp,
                           fontWeight: FontWeight.w300,
                           color: Color(0xff121212)

                         ),
                         children: [
                           TextSpan(text:" Didn’t receive code."),
                           TextSpan(text: "Resend (51s)",style: TextStyle(
                             color: Color(0xffEB6A58)
                           )),
                         ]
                       )),
                       SizedBox(height: 15.h,),
                       SizedBox(
                         height: 45.h,
                         width: 296.w,
                         child: elevatedbtnwidget(text: "Continue",
                           onPressed: () {
                             if (keyOTP.currentState!.validate()) {
                               print(otpControllers[0].text);
                               print('verified');

                               Navigator.push(context, MaterialPageRoute(builder:
                                   (context) =>Login() ,));
                             // showDialog(context: context, builder: (context) {
                             //
                             //   return password_reset_successful_dialog();},);
                             }
                           }
                             ),
                             ),
                     ],
                   ),
                 )
             ),
           ),
         );
       },);

  }

  Widget OtpWidget(int i) {
    return Padding(
      padding: EdgeInsets.all(2).r,
      child: SizedBox(
        width: 50.w,
        height: 60.h,
        child: TextFormField(
          controller: otpControllers[i],
          focusNode: focusNodes[i],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "";
            }
            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
              return "Numbers only allowed";
            }
            return null;
          },
          maxLength: 1,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            counterText: "",
            filled: true,
            error: errorHint,
            fillColor: Color(0xffffffff),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                    color: Color(0xffEAEFF5),
                    width: 1
                )
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14).r,
                borderSide: BorderSide.none
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(
                  color: Colors.red
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14).r,
              borderSide: BorderSide(
                color: Color(0xffeb6a58),
              ),
            ),
          ),
          onChanged: (value) {
            if (value.isNotEmpty) {
              if (i < focusNodes.length - 1) {
                focusNodes[i + 1].requestFocus();
              } else {
                focusNodes[i].unfocus();
              }
            } else if (value.isEmpty) {
              if (i > 0) {
                focusNodes[i - 1].requestFocus();
              }
            }
          },
        ),
      ),
    );
  }
}






