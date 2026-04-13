import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/Auth/widgets/password_set_sucessful.dart';

class password_reset_successful_dialog extends StatelessWidget {
  const password_reset_successful_dialog({
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
            .circular(20).r,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius
            .circular(20)
            .r,
        child: SizedBox(
            width: 324.w,
            height: 516.h,
            child: PasswordSetSucessful(),
        ),
      ),
    );
  }
}