import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gittest/widgets/boxWidget.dart';

class ListviewSearch extends StatefulWidget {
   ListviewSearch({super.key});

  @override
  State<ListviewSearch> createState() => _ListviewSearchState();
}

class _ListviewSearchState extends State<ListviewSearch> {
  final List<Map<String,String>> listCont = [
    {"imageSrc":"assets/images/fresh.jpg",
      "title": "Fresh Sandwitch",
      "price":"12",
      "discount":"-30"
    },
    {"imageSrc":"assets/images/grilled.jpg",
      "title": "Grilled Sandwitch",
      "price":"10",
      "discount":"-60"
    },
    {"imageSrc":"assets/images/banana.jpg",
      "title": "Banana Sandwitch",
      "price":"22",
      "discount":"-70"
    },
    {"imageSrc":"assets/images/spicy.jpg",
      "price": "10",
      "title":"Spicy berry Sandwitch",
      "discount":"-50"
    },
    {"imageSrc":"assets/images/four.jpg",
      "title": "Fresh Salad",
      "price":"24",
      "discount":"-50"
    },

  ];
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding:  EdgeInsets.all(15).r,
          child: SingleChildScrollView(
            child: Column(
              spacing: 20.h,
              children: [
                 ListView.builder(
                  itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10).r,
                    child: Container(
                      width: 325.w,
                      height: 114.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffF4F4F5),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                      ),
                      child: Row(
                        children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12).r,
                                child: Image.asset("${listCont[index]["imageSrc"]}",
                                  width:92.w,height: 91.h,fit: BoxFit.cover,),
                            ),
                            Container(
                              width: 53.w,
                              height: 25.h,
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
                                    "${listCont[index]["discount"]}",
                                    style: TextStyle(
                                      color: Color(0xffffffff),
                                      fontSize: 12.sp,
                                      fontFamily: 'Montserrat-Light',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:  EdgeInsets.all(10).r,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 5.h,
                            children: [
                              Text("\$${listCont[index]["price"]}",style: TextStyle(
                                color: Color(0xffF26333),
                                fontFamily: "Montserrat-Light",
                                fontWeight: FontWeight.w500,
                                fontSize: 21.sp
                              ),),
                              Text("${listCont[index]["title"]}",style: TextStyle(
                                  color: Color(0xff121212),
                                  fontFamily: "Montserrat-Bold",
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17.sp
                              ),),
                              Row(
                                spacing: 25.w,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    spacing: 15.w,
                                    children: [
                                      SvgPicture.asset("assets/images/star.svg",width: 20.w,
                                        height:18.h,),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff5bc439),
                                          fontSize: 15.sp,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
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
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Montserrat-Light',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],),
                    ),
                  );
                },
                itemCount: listCont.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
