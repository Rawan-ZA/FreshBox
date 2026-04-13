import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class recommended_container extends StatelessWidget {
   late Color backgroundColor;
   late  String imageSrc;
   late String title;
   late String subTitle;
   late  String price;

   recommended_container({super.key,
     required this.title,
     required this.subTitle,
     required this.imageSrc,
     required this.price,
     required this.backgroundColor
     }
       );

   @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      padding: EdgeInsets.all(16).r,
      width: 325.w ,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16).r,
      ),
      child:
      Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            "$imageSrc",
            width: 104.w,
            height: 104.h,
          ),
          Expanded(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat-Light',
                  ),
                ),
                Text(
                  "$subTitle",
                  style: TextStyle(
                    color: Color(0xff121212),
                    fontWeight: FontWeight.w300,
                    fontSize: 13.sp,
                    height: 1.7.h,
                    overflow: TextOverflow.visible
                  ),
                  maxLines: 2,
                ),
                Text(
                  "\$ $price",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 21.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}