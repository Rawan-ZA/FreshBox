import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'forgetPassword.dart';

class forget_password_dialog extends StatelessWidget {
  const forget_password_dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: AlignmentGeometry.center,
      insetPadding: EdgeInsets.all(15).r,
      elevation:0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20).r,
        child: SizedBox(
          width:333.w ,
          height: 358.h,
          child:
          Forgetpassword(),),
      ),
    );
  }
}