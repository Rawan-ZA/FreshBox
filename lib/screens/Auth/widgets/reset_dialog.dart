import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/Auth/widgets/reset_password.dart';

class reset_dialog extends StatelessWidget {
  const reset_dialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffffffff),
      alignment: AlignmentGeometry.center,
      insetPadding: EdgeInsets.all(15).r,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius
            .circular(20)
            .r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius
            .circular(20)
            .r,
        child: SizedBox(
            width: 324.w,
            height: 516.h,
            child: ResetPassword()
        ),
      ),
    );
  }
}