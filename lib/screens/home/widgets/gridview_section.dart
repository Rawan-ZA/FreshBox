import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class gridview_section extends StatelessWidget {
  const gridview_section({
    super.key,
    required this.imagesSrc,
    this.iconColor= Colors.red,
    this.iconSize = 20,
    this.scrollDirection = Axis.vertical,
    this.crossAxisCount = 2,
    this.childAspectRatio = 1.1 /2.1,
    this.scrollPhysics ,
  });

  final List<Map<String, String>> imagesSrc;
  final Color iconColor ;
  final Axis scrollDirection ;
  final int iconSize ;
  final int crossAxisCount ;
  final double childAspectRatio;
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: scrollPhysics ?? ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio:   childAspectRatio,  //1.1 /2.1,
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: imagesSrc.length,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(8).r,
          // width: 160.w,
          height: 271.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16).r,
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  color: Color(0xfff5f5f5),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                )
              ]
          ),
          child: Column(
            spacing: 20.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20).r,
                      child: Image.asset(
                        imagesSrc[index]["src"]!,
                        fit: BoxFit.cover,
                        height: double.infinity,
                        width: 200.w,
                      ),
                    ),
                    Container(
                      width: 65.w,
                      height: 40.h,
                      padding: EdgeInsets.all(5).r,
                      margin: EdgeInsets.all(10).r,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Color(0xffeb6a58),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: Color(0xffffffff),
                            size: 15.sp,
                          ),
                          Text(
                            " -30%",
                            style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                imagesSrc[index]['title']!,
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat-Light',
                ),
              ),
              Row(
                spacing: 15.w,
                children: [
                  SvgPicture.asset("assets/images/clock.svg",
                    width: 20.w,height: 18.h,),
                  // Icon(
                  //   Icons.alarm,
                  //   size: 26.sp,
                  //   color: Color(0xffa0a0a0),
                  // ),
                  Text(
                    "30 Min",
                    style: TextStyle(
                      color: Color(0xffa0a0a0),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/images/star.svg", width: 24.w,
                        height: iconSize.h,color: Color(0xff5bc439),),
                      // Icon(
                      //   Icons.star_rounded,
                      //   size: 26.sp,
                      //   color: Color(0xff5bc439),
                      // ),
                      Text(
                        "4.5",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5bc439),
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset("assets/images/Heart.svg",color: iconColor,
                    width: 24.w,
                   height: iconSize.h,),
                  // Icon(
                  //   Icons.favorite,
                  //   color: Color(0xffd0ced4),
                  //   size: 26.sp,
                  // ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}