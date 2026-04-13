import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/elevatedbtnwidget.dart';
class Rate extends StatefulWidget {
  const Rate({super.key});

  @override
  State<Rate> createState() => _RateState();
}

class _RateState extends State<Rate> {
  late TextEditingController instructionController;
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instructionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    instructionController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:  Padding(
        padding: EdgeInsets.all(20).r,
        child: Column(
          spacing: 15.h,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Rate This Food",style: TextStyle(
               color: Color(0xf313131f),
               fontWeight: FontWeight.w500,
               fontFamily: "Montserrat-Bold",
               fontSize: 19.sp
             ),),
              Expanded(
                child: Text("How is your experience enjoying this food? Let me know what you think.",style:
                  TextStyle(
                    color: Color(0xff616161),
                      fontWeight: FontWeight.w300,
                      fontFamily: "Montserrat-Bold",
                      fontSize: 15.sp
                  ),
                overflow: TextOverflow.visible,
                maxLines: 3,),
              ),
              Row(
                spacing: 25.w,
                children: [
                  SvgPicture.asset("assets/images/starsolid.svg",width: 25.w,height: 25.h,),
                  SvgPicture.asset("assets/images/starsolid.svg",width: 25.w,height: 25.h,),
                  SvgPicture.asset("assets/images/starsolid.svg",width: 25.w,height: 25.h,),
                  SvgPicture.asset("assets/images/starsolid.svg",width: 25.w,height: 25.h,),
                  SvgPicture.asset("assets/images/starfill.svg",width: 25.w,height: 25.h,),
                ],
              ),
            TextField(
              controller: instructionController,
              maxLines: 2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffeeeef0),
                hint: Text(
                  "Write Instructions",
                  style: TextStyle(
                    color: Color(0xff8C8896),
                    fontSize: 16.sp,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ),


            SizedBox(width: 296.w,height: 45.h,
              child:elevatedbtnwidget(text: "Continue", onPressed: () {
              } ,),),
            SizedBox(height: 5.h,),


          ],
        ),
      ),
    );
  }
}
