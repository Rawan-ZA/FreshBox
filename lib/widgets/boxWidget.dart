import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class boxWidget extends StatelessWidget {
  late String image;
  late String text;
  late double price;
  late double discount;
  late double rate;

  boxWidget({required this.image, required this.text, required this.price, required this.discount,
     required this.rate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      padding: EdgeInsets.all(10).r,
      width: double.infinity.w,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(10).r,
      ),
      child: Row(
        spacing: 15.w,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12).r,
                child: Image.asset(
                 image,
                  width: 110.w,
                  fit: BoxFit.cover,
                  height: 120.h,
                ),
              ),
              Container(
                width: 62.w,
                height: 30.h,
                padding: EdgeInsets.all(5).r,
                margin: EdgeInsets.all(10).r,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xffeb6a58),
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.percent_outlined,
                      color: Color(0xffffffff),
                      size: 15.sp,
                    ),
                    Text(
                      "$discount",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 12.sp,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            verticalDirection: VerticalDirection.down,
            spacing: 7.h,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$$price",
                style: TextStyle(
                  color: Color(0xfff26333),
                  fontFamily: 'Montserrat-Bold',
                  fontWeight: FontWeight.w500,
                  fontSize: 21.sp,
                ),
              ),
              Text(
                "$text",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat-Light',
                  fontSize: 18.sp,
                ),
              ),
              Expanded(
                child:
                Row(
                  spacing: 20.w,
                  children: [
                    Row(
                      spacing: 10.w,
                      children: [
                        SvgPicture.asset("assets/images/star.svg",),
                        // Icon(
                        //   Icons.star_rounded,
                        //   size: 24.sp,
                        //   color: Color(0xff5bc439),
                        // ),
                        Text(
                          "$rate",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5bc439),
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat-Bold',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 8.w,
                      children: [
                        // InkWell(
                        //   child:
                        Container(
                          width: 35.w,
                          height: 38.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffe3e2e6),
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                          child: Icon(
                            Icons.minimize,
                            size: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // onTap: () {
                        //   // setState(() {
                        //   //   counter--;
                        //   //   if (counter < 0) {
                        //   //     counter = 0;
                        //   //   }
                        //   // });
                        // },
                        // ),
                        Container(
                          width: 25.w,
                          height: 25.h,
                          decoration: BoxDecoration(),
                          child: Text(
                            "0",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff121212),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     // setState(() {
                        //     //   counter++;
                        //     // });
                        //   },
                        //   child:
                        Container(
                          width: 35.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: Color(0xffe3e2e6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.add, size: 20.sp),
                        ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
