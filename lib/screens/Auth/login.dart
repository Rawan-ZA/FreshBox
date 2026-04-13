import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/screens/Auth/signup.dart';
import 'package:gittest/screens/Auth/widgets/forget_password_dialog.dart';
import 'package:gittest/screens/Auth/widgets/textform_field_widgte.dart';
import 'package:gittest/screens/home/home.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';
import 'package:gittest/screens/Auth//widgets/forgetPassword.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // TODO: implement State

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  Widget? errorHint;
  final keyForm = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    emailController = TextEditingController();

    super.initState();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f8),
        body: Padding(
          padding: const EdgeInsets.all(20).r,
          child:
          Column(
            spacing: 15.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 30.h,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20,).r,
                child: Center(
                  child:Image.asset("assets/images/mainLogo.png")
                ),
              ),
              Column(
                spacing: 10.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Let’s Sign You In",
                    style: TextStyle(
                      color: Color(0xff111a2c),
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  Text(
                    "Welcome back, you’ve been missed!",
                    style: TextStyle(
                      color: Color(0xff6d6d6e),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10.h,),
                ],
              ),
              Form(
                key: keyForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 12.w,
                  children: [
                    Text(
                      "Username or E-mail",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(
                      width: 450.w,
                      child:
                      textform_field_widget(
                        filledColor: Color(0xffffffff),
                        filled: true,
                        emailController: emailController,
                          errorHint: errorHint,value: "Enter your username or E-mail",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is empty";
                        } else if (!value.contains("@")) {
                          return "Email is not correct";
                        }
                        return null;
                      }, outlainBorderRadius: 12.0,),
                    ),

                    Text(
                      "Password",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 17.sp),
                    ),
                    SizedBox(
                      width: 450.w,

                      child:  textform_field_widget(emailController: passwordController,
                          errorHint: errorHint,filledColor: Color(0xffffffff),
                          filled: true,
                          obscureText: true,
                          obscuringCharacter: '*',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password required";
                            } else if (value.length < 8) {
                              return "Password is weak";
                            } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return "Must contain uppercase letter";
                            } else {
                              return null;
                            }
                          }, value: "Enter your password")

                      // TextFormField(
                      //   controller: ,
                      //   obscureText: true,
                      //   obscuringCharacter: '*',
                      //   decoration: InputDecoration(
                      //     error: errorHint,
                      //     focusedErrorBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     suffixIcon: Icon(
                      //       Icons.visibility_off_outlined,
                      //       color: Color(0xff121212),
                      //       size: 26.sp,
                      //     ),
                      //     contentPadding: EdgeInsets.symmetric(
                      //       vertical: 20,
                      //       horizontal: 20,
                      //     ),
                      //     hintText: "",
                      //     filled: true,
                      //     fillColor: Color(0xffffffff),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10).r,
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     focusedBorder: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10).r,
                      //       borderSide: BorderSide.none,
                      //     ),
                      //     hoverColor: Color(0xffffffff),
                      //   ),
                      //   validator:
                      // ),
                    ),

                   Container(
                     alignment: Alignment.centerRight,
                     child: TextButton(
                       onPressed: () {
                         showDialog(context: context,
                           builder: (context) {
                             return
                               forget_password_dialog();
                           },
                         );
                       },
                       child: Text(
                         "Forgot Password?",
                         style: TextStyle(),
                         textAlign: TextAlign.right,
                       ),
                     ),
                   )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: elevatedbtnwidget(
                        onPressed: () {if (keyForm.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          Home(),));
                        }
                        }, text: 'LogIn',
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
                      TextSpan(text: "Don’t have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        recognizer: TapGestureRecognizer()..onTap = (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
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
                  borderRadius: BorderRadius.circular(12).r,
                ),
                child: Row(
                  spacing: 8.w,
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
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ],
                ),
              ),
              Container(
                width: 450.w,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xff4267b2),
                  borderRadius: BorderRadius.circular(12).r,
                ),
                child: Row(
                  spacing: 8.w,
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
    );
  }
}




