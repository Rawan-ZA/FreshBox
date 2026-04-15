import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class textform_field_widget extends StatelessWidget {
   textform_field_widget({
    super.key,
    required this.emailController,
    required this.errorHint,
    this.suffixIcon,
    required this.validator,
    // this.onChanged = (password),
    this.obscuringCharacter = '*',
    this.obscureText = false,
    required this.value,
     this.outlainBorderRadius = 12.0,
     this.filled =false,
    this.filledColor = Colors.white,
     this.onChanged = _passwordValidation,
   });
  final TextEditingController emailController;
  final Widget? errorHint;
  final String value;
  final double  outlainBorderRadius ;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final ValueChanged<String> onChanged;
  final String obscuringCharacter;
  final bool obscureText;
  final bool filled ;
  final Color filledColor ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(

        error: errorHint,
        contentPadding: EdgeInsets.symmetric(
          vertical: 20.r,
          horizontal: 20.r,
        ),
        filled: filled,
        fillColor: filledColor,
        hintText: value,
        helperText: " ",
        errorStyle: TextStyle(
          height:0.5.h
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(outlainBorderRadius).r,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(outlainBorderRadius).r,
          borderSide: BorderSide.none,
        ),
        hoverColor: Color(0xffffffff),
      ),
      validator: validator,
        obscuringCharacter: obscuringCharacter,
        obscureText: obscureText,
        onChanged: onChanged,
    );
  }
}
void _passwordValidation(String value){}