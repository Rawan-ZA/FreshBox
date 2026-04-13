import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/Auth/widgets/password_reset_successful_dialog.dart';
import 'package:gittest/screens/Auth/widgets/textform_field_widgte.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool uppercase = false;
  bool number = false;
  bool specialChar = false;
  void validatePassword(String value) {
    setState(() {
      uppercase = value.contains(RegExp(r'[A-Z]'));
      number = value.contains(RegExp(r'[0-9]'));
      specialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  Widget? errorHint;
  final keyForm = GlobalKey<FormState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    passwordController.dispose();

    }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xffffffff),
     body:  Padding(
       padding: EdgeInsets.all(15).r,
       child: Column(
         spacing: 15.h,
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Reset Your Password",style: TextStyle(
               color: Color(0xff313131),
               fontFamily: "Montserrat-Bold",
               fontSize: 19.sp,
               fontWeight: FontWeight.w500
           ),),
           Text("At least 9 characters, with uppercase and lowercase letters",style: TextStyle(
               color: Color(0xff616161),
               fontFamily: "Montserrat",
               fontSize: 15.5.sp,
               fontWeight: FontWeight.w300
           ),),
           Form(
             key: keyForm,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               mainAxisAlignment: MainAxisAlignment.start,
               spacing: 12.w,
               children: [
                 Text(
                   "Password",
                   textAlign: TextAlign.start,
                   style: TextStyle(fontSize: 14.7.sp,fontWeight: FontWeight.w300),

                 ),
                 SizedBox(
                   width: 281.w,
                   height: 47.h,
                   child: textform_field_widget(emailController: passwordController,
                       errorHint: errorHint,
                     validator:  (value) {
                         if(value == null || value.isEmpty){
                           return "Is required";
                         }
                         else if(value.length<8){
                           return "Password is weak";
                         }
                         else if (!RegExp(r'[a-zA-Z0-9]').hasMatch(value)){
                           return "Must contains uppercase and lowercase characters";
                         }
                         else{
                           return null;
                         }
                       }, value: "",suffixIcon:  Icon(
                         Icons.visibility_off_outlined,
                         color: Color(0xff121212),
                         size: 26.sp,
                       ),obscureText: true,
                     filled: true,
                     obscuringCharacter: "*",
                     filledColor: Color(0xffF5F5F8),
                     onChanged:validatePassword,
                     )
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
                   //     // hintText: "Create Your Password",
                   //     filled: true,
                   //     fillColor: Color(0xffF5F5F8),
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
                   //
                   //
                   // ),
                 ),
                 Text(
                   "Confirm Password",
                   textAlign: TextAlign.start,
                   style: TextStyle(fontSize: 14.7.sp,fontWeight: FontWeight.w300),

                 ),
                 SizedBox(
                   width: 281.w,
                   height: 47.h,
                   child: textform_field_widget(
                     emailController: confirmPasswordController,
                     filled: true,
                     obscuringCharacter: "*",
                     filledColor: Color(0xffF5F5F8),
                       errorHint: errorHint, validator: (value) {
                         if(value == null || value.isEmpty){
                           return "Is required";
                         }
                         else if(value != passwordController.text){
                           return "Password doesn't match";
                         }
                         else{
                           return null;
                         }
                       }, value: "",suffixIcon:Icon(
                         Icons.visibility_off_outlined,
                         color: Color(0xff121212),
                         size: 26.sp,
                       ),obscureText: true,)
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
                   //     // hintText: "Create Your Password",
                   //     filled: true,
                   //     fillColor: Color(0xffF5F5F8),
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
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     buildValidationRow("1 CAPITAL letter", uppercase),
                     SizedBox(height: 5.h),
                     buildValidationRow("1 number", number),
                     SizedBox(height: 5.h),
                     buildValidationRow("1 special character like @,#,\$,-,/", specialChar),
                   ],
                 ),
                 SizedBox(height: 43.w,
                 width:281.h ,
                 child: elevatedbtnwidget(text: "Continue", onPressed: () {
                     if(keyForm.currentState!.validate()){
                       print(passwordController.text);
                       print(confirmPasswordController.text);
                       showDialog(context: context, builder: (context) {

                         return password_reset_successful_dialog();},);
                     }
                      // showDialog(context: context, builder: (context) {
                      //   return password_reset_successful_dialog();});

                 },
                 ),
                 ),
               ],
             ),
           ),
         ],
       ),
     ),
   );
  }
}
Widget buildValidationRow(String text, bool isValid) {
  return Row(
    children: [
      Icon(
        isValid ? Icons.check_circle_outline : Icons.cancel,
        color: isValid ? Colors.green : Colors.red,
        size: 18.sp,
      ),
      SizedBox(width: 8.w),
      Text(
        text,
        style: TextStyle(
          color: isValid ? Colors.green : Colors.red,
          fontSize: 14.7.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Montserrat"
        ),
      ),
    ],
  );
}

