import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  int index = 0;
  bool isActive = false;
  List<Map<String, String>> favouriteCont = [
    {
      "title": "Fresh Sandwitch",
      "image": "assets/images/fresh.jpg",
      "price": "\$12",
    },
    {
      "title": "Grilled Sandwitch",
      "image": "assets/images/grilled.jpg",
      "price": "\$10",
    },
    {
      "title": "Banana Sandwitch",
      "image": "assets/images/grilled.jpg",
      "price": "\$22",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xffffffff),
          title: Text("Favourite"),
          actions: [
            Container(
              margin: EdgeInsets.all(8).r,
              padding: EdgeInsets.all(10).r,
              height: 48.h,
              width: 48.w,
              child: Icon(Icons.search_sharp, size: 33.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12).r,
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
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20).r,
          child: Column(
            spacing: 15.h,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: favouriteCont.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 15.h),
                      width: 325.w,
                      height: 112.h,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 12.w,
                      ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.h,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10).r,
                            child: Stack(
                              children: [
                                Image.asset(
                                  "${favouriteCont[index]['image']}",
                                  width: 92.w,
                                  height: 91.h,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${favouriteCont[index]['price']}",style: TextStyle(
                                color: Color(0xffF26333),
                                fontSize: 21.sp,
                                fontFamily: "Montserrat-Bold",
                                fontWeight: FontWeight.w500
                              ),),
                              Text("${favouriteCont[index]['title']}",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: "Montserrat-Light",
                                  fontWeight: FontWeight.w300
                              ),),
                              Row(
                                spacing: 25.w,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 8.w,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        size: 24.sp,
                                        color: Color(0xff5bc439),
                                      ),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xff5bc439),
                                          fontSize: 15.sp,
                                          fontFamily: 'Montserrat',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    spacing: 8.w,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.alarm,
                                        size: 24.sp,
                                        color: Color(0xffA0A0A0),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Text(
                                        "30 Min",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffA0A0A0),
                                          fontSize: 15.sp,
                                          fontFamily: 'Montserrat-Bold',
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xff121212),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(Icons.close, color: Color(0xffffffff)),
                            width: 25.w,
                            height: 25.h,
                          ),
                        ],
                      ),

                      // Row(
                      //   spacing: 10.w,
                      //   children: [
                      //      ),
                      //     Expanded(
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         children: [
                      //           Text("${notificationCont[index]['title']}",
                      //             style:TextStyle(
                      //                 fontFamily: "Montserrat-Light",
                      //                 fontSize: 16.sp,
                      //                 fontWeight: FontWeight.w500
                      //             ),
                      //           ),
                      //           Text("${notificationCont[index]['description']}",
                      //             overflow: TextOverflow.visible,
                      //             maxLines: 3,
                      //             style: TextStyle(
                      //                 color: Color(0xff3D3A45),
                      //                 fontWeight: FontWeight.w300,
                      //                 height: 1.5.h,
                      //                 fontSize: 15.sp
                      //             ),),
                      //         ],),
                      //     )

                      // ],
                    );
                  },
                ),
              ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // fixedColor: Color(0xff121212),
          selectedItemColor: Color(0xff121212),
          iconSize: 26.sp,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              print(index);
              print(isActive);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "",
              backgroundColor: Color(0xffffffff),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/Order.svg",
                color: isActive ? Color(0xff121212) : Color(0xffD1CFD5),
              ),
              label: "",
              backgroundColor: Color(0xffffffff),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/Heart.svg",
                color: isActive ? Color(0xff121212) : Color(0xffD1CFD5),
              ),
              label: "",
              backgroundColor: Color(0xffffffff),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "",
              backgroundColor: Color(0xffffffff),
            ),
          ],
        ),
      ),
    );
  }
}
