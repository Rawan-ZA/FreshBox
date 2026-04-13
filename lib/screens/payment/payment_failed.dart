import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/elevatedbtnwidget.dart';
class PaymentFailed extends StatefulWidget {
  const PaymentFailed({super.key});

  @override
  State<PaymentFailed> createState() => _PaymentFailedState();
}

class _PaymentFailedState extends State<PaymentFailed> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xffffffff),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 48,
              width: 48,
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, size: 20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xfffbe1de),
                    blurStyle: BlurStyle.outer,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
          title: Text("Payment Failed"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              SvgPicture.asset("assets/images/Unhappy.svg",width: 277.w,height: 218.h,),
              Text("Unfortunately!",style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32.sp,
                fontFamily:"Montserrat-Bold" ,
              ),),
              Text("You Payment failed,\n Please try Again.",
                style: TextStyle(
                    color: Color(0xff525C67),
                    fontWeight: FontWeight.w300,
                    fontSize: 17.sp,
                    fontFamily:"Montserrat-Bold" ,
                    height: 1.7
                ), textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.visible,

              ),
              SizedBox(height: 150.h,),
              SizedBox(height: 50.h,
                  width: double.infinity,
                  child: elevatedbtnwidget(text: "Try Again", onPressed: () {},)
              )
            ],
          ),
        ),
      ),
    );
  }
}
