import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gittest/screens/home/widgets/rate.dart';
import 'package:gittest/screens/payment/tracker_screen.dart';

import '../../widgets/elevatedbtnwidget.dart';
class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabBar;
  bool isActive  = false;
  late int currentIndex =0;
  List<Map<String,String>> historyCont = [
    {
      "title":"Starbucks",
      "image":"assets/images/h3.png",
      "price":"\$30",
      "date":"17 Jan, 02:30. 3 items",
      "status" :"Delivered"
    },
    {
      "title":"Domino’s Pizza",
      "image":"assets/images/h2.png",
      "price":"\$45.30",
      "date":"29 Jan, 02:30. 2 items",
      "status" :"Cancel"
    },
    {
      "title":"Pizza Hut",
      "image":"assets/images/h1.png",
      "price":"\$55.00",
      "date":"30 Jan, 02:30. 3 items",
      "status" :"Delivered"
    },

  ];
  List<Map<String,String>> upcomingCont=[
    {
      "title":"Starbucks",
      "image":"assets/images/h3.png",
      "price":"\$30",
      "date":"17 Jan, 02:30. 3 items",
      "status" :"On the Way"
    },
    {
      "title":"Domino’s Pizza",
      "image":"assets/images/h2.png",
      "price":"\$30",
      "date":"29 Jan, 02:30. 2 items",
      "status" :"On the Way"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = TabController(length: 2, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabBar.dispose();
  }
    @override
    Widget build(BuildContext context) {
      return  Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text("order"),
        ),
        backgroundColor: Color(0xffffffff),
        body:
        // index == 0 ? PopulerFood() : index == 1 ? ProductDetails() :
        Column(
          children: [
            Container(
              width: 325.w,
              height: 40.h,
              margin: EdgeInsets.all(10).r,
              decoration: BoxDecoration(
                  color: Color(0xfff1f1f2),
                  borderRadius: BorderRadius.circular(15).r
              ),
              child: TabBar(
                onTap: (value) {
                  print(value);
                  setState(() {
                    currentIndex = value;
                  });
                },
                  indicatorPadding:EdgeInsets.all(1).r ,
                  dividerColor: Colors.transparent,
                  indicatorColor: Color(0xff040C22),
                  controller: tabBar,
                  unselectedLabelColor:Color(0xfff1f1f2) ,
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat",
                    color: Color(0xff8C8896)
                  ),

                  tabs: [
                    Tab(
                        child: Text('History',style: TextStyle(
                          color: currentIndex == 0 ? Color(0xff121212) : Color(0xff8C8896),
                          fontFamily: currentIndex == 0 ? "Montserrat-Bold": "Montserrat",
                          fontWeight: FontWeight.w500,
                          fontSize: 17.sp,
                        ),
                        )

                    ),
                    Tab(
                        child: Text('Upcoming',style: TextStyle(
                            color: currentIndex == 1 ? Color(0xff121212) : Color(0xff8C8896),
                            fontFamily: currentIndex == 1 ? "Montserrat-Bold": "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp
                        ),
                        )
                    ),
                  ]),
            ),
            Expanded(
              child:
              TabBarView(
                  controller: tabBar,
                  children:[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 20.h),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 15.h),
                            padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                            width: 325.w,
                            height: 154.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10).r,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffF4F4F5),
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),]
                            ),
                            child: Column(
                              children: [
                                Row(
                                  spacing: 10.w,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset("${historyCont[index]["image"]}",
                                      width: 60.w,height: 60.h,),
                                    Expanded(
                                      child: Column(
                                        spacing: 2.h,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            spacing: 15.w,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("${historyCont[index]["title"]}",style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.sp,
                                                  fontFamily: "Montserrat-Bold"
                                              ),),
                                              Text("${historyCont[index]["price"]}",style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17.sp,
                                                  fontFamily: "Montserrat-Bold"
                                              ),),
                                            ],
                                          ),
                                          Text("${historyCont[index]["date"]}",
                                            style: TextStyle(
                                                color: Color(0xff3D3A45),
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15.sp,
                                                fontFamily: "Montserrat"

                                            ),),
                                          Text("${historyCont[index]["status"]}",style:
                                          TextStyle(
                                              color: Color(0xff5BC439),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13.sp,
                                              fontFamily: "Montserrat-Bold"
                                          ),),

                                        ],
                                      ),
                                    )


                                  ],
                                ),
                                Row(
                                  spacing: 10.w,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: elevatedbtnwidget(text: "Re-order", onPressed: () {},
                                      ),
                                    ),
                                    Expanded(child: elevatedbtnwidget(text: "Rate", onPressed: () {
                                      showDialog(context: context,
                                        builder: (context) {
                                          return Dialog(
                                            alignment: AlignmentGeometry.center,
                                            insetPadding: EdgeInsets.all(15).r,
                                            elevation:0.5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20).r,
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20).r,
                                              child: SizedBox(
                                                width:333.w ,
                                                height: 358.h,
                                                child:
                                                Rate(),),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                      textColor: Color(0xff121212),
                                      bgColor: Color(0xffD1CFD5),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: historyCont.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w,),
                          child: Text("Order in progress",style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat-Light"
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 20.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
                                    width: 325.w,
                                    height: 154.h,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10).r,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffF4F4F5),
                                            blurStyle: BlurStyle.outer,
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),]
                                    ),
                                    child:
                                    Column(
                                      children: [
                                        Row(
                                          spacing: 10.w,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset("${historyCont[index]["image"]}",
                                              width: 60.w,height: 60.h,),
                                            Expanded(
                                              child: Column(
                                                spacing: 2.h,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    spacing: 15.w,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("${upcomingCont[index]["title"]}",style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 17.sp,
                                                          fontFamily: "Montserrat-Bold"
                                                      ),),
                                                      Text("${upcomingCont[index]["price"]}",style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontSize: 17.sp,
                                                          fontFamily: "Montserrat-Bold"
                                                      ),),
                                                    ],
                                                  ),
                                                  Text("${upcomingCont[index]["date"]}",
                                                    style: TextStyle(
                                                        color: Color(0xff3D3A45),
                                                        fontWeight: FontWeight.w300,
                                                        fontSize: 15.sp,
                                                        fontFamily: "Montserrat"

                                                    ),),
                                                  Text("${upcomingCont[index]["status"]}",style:
                                                  TextStyle(
                                                      color: Color(0xff4267B2),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: 13.sp,
                                                      fontFamily: "Montserrat-Bold"
                                                  ),),

                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                        Row(
                                          spacing: 10.w,
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            elevatedbtnwidget(
                                              text: "Track Order", onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => TrackerScreen(),));
                                            },
                                              textColor: Color(0xffffffff),
                                              bgColor: Color(0xff8C8896),
                                            ),
                                            Expanded(
                                              child: elevatedbtnwidget(text: "Cancel", onPressed: () {},
                                                textColor: Color(0xffffffff),
                                                bgColor: Color(0xffEB9C9B),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                itemCount: upcomingCont.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                              ),


                            ],
                          ),
                        ),

                      ],
                    ),

                  ]),
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   // fixedColor: Color(0xff121212),
        //     selectedItemColor: Color(0xff121212),
        //     iconSize: 26.sp,
        //     currentIndex: index,
        //     onTap: (value) {
        //       setState(() {
        //         index=value;
        //         index == 1 ? isActive = true ? index==2 :  isActive = true
        //             : isActive =false;
        //         print(index);
        //         print(isActive);
        //
        //       });
        //     },
        //     items:[
        //       BottomNavigationBarItem(icon:Icon(Icons.home_filled,),label: "", backgroundColor: Color(0xffffffff),),
        //       BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Order.svg",color: isActive ? Color(0xff121212) :Color(0xffD1CFD5),),label: "", backgroundColor: Color(0xffffffff),),
        //       BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Heart.svg",
        //         color: isActive ?Color(0xff121212) :Color(0xffD1CFD5) ,),label: "", backgroundColor: Color(0xffffffff),),
        //       BottomNavigationBarItem(icon:Icon(Icons.notifications),label: "", backgroundColor: Color(0xffffffff),),
        //     ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffEB6A58),
          shape: CircleBorder(),
          child: Icon(Icons.shopping_bag,color: Color(0xffffffff),),
          onPressed: () {

          },),
    );
  }
}
