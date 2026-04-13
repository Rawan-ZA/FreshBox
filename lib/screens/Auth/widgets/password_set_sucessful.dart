import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/screens/Auth/login.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';

class PasswordSetSucessful extends StatefulWidget {
  const PasswordSetSucessful({super.key});

  @override
  State<PasswordSetSucessful> createState() => _PasswordSetSucessfulState();
}

class _PasswordSetSucessfulState extends State<PasswordSetSucessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Padding(
        padding: EdgeInsets.all(15).r,
        child: Column(
          spacing: 15.h,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Text("Congratulations!",style: TextStyle(
             fontWeight: FontWeight.w500,
             fontSize: 19.sp,
             fontFamily: "Montserrat-Bold",
             color: Color(0xff313131)
           ),),
            Text("You successfully rest your \n password. \n Now you are good to go",
              textAlign: TextAlign.center,
              style:
              TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.5.sp,
                  fontFamily: "Montserrat",
                  height: 1.7.h,
                  color: Color(0xff616161)
              ),),
            SvgPicture.asset("assets/images/successful.svg",width: 221.w,height: 219.h,),
            SizedBox(height: 20.h,),
            SizedBox(
              height: 45.h,
              width: 296.w,
              child: elevatedbtnwidget(text: "Jump Into Log In", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              },),
            )
          ],
        ),
      ),
    );
  }
}
