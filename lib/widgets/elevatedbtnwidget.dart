import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class elevatedbtnwidget extends StatelessWidget {
  elevatedbtnwidget({
  this.bgColor = const Color(0xffeb6a58),
  this.textColor = const Color(0xffffffff),
  super.key, required this.text,
 required this.onPressed
      });

  late String text;
   Color bgColor ;
   Color textColor;
  late VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: bgColor,
        alignment: Alignment.center,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          color: textColor,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat-Light"
        ),
      ),
    );
  }
}

