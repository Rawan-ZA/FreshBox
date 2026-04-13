import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  int index = 0;
  bool isActive  = false;
  List<Map<String,String>> notificationCont=[
    {
      "title":"Starbucks",
      "image":"assets/images/h3.png",
      "description":"Buy 1 get 1 free for small sizes until Nov 30, 2020",
    },
    {
      "title":"Veg Biryani - 35% sale today",
      "image":"assets/images/h2.png",
      "description":"Enter discount code NEW2021 for 35% off for Veg Biryani"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xffffffff),
        title: Text("Notification"),
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
        padding:  EdgeInsets.all(20).r,
        child: Column(
          spacing: 20.h,
          mainAxisAlignment: MainAxisAlignment.start,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Today (2 Offers)",style: TextStyle(
              color: Color(0xff121212),
              fontWeight:FontWeight.w300,
              fontSize: 17.sp,
              fontFamily: "Montserrat-Light"
            ),),
            Expanded(
              child: ListView.builder(
                        itemCount: notificationCont.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                 return Container(
                   width: 325.w,
                   height: 112.h,
                     margin: EdgeInsets.symmetric(vertical: 15.h),
                     padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 12.w),
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
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     spacing: 10.h,
                     children: [
                      Row(
                        spacing: 10.w,
                        children: [
                        Image.asset("${notificationCont[index]['image']}",
                          width: 60.w,height: 60.h,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            Text("${notificationCont[index]['title']}",
                              style:TextStyle(
                               fontFamily: "Montserrat-Light",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                            Text("${notificationCont[index]['description']}",
                              overflow: TextOverflow.visible,
                              maxLines: 3,
                            style: TextStyle(
                              color: Color(0xff3D3A45),
                              fontWeight: FontWeight.w300,
                              height: 1.5.h,
                              fontSize: 15.sp
                            ),),
                          ],),
                        )

                      ],),
                     ],
                   )
                 );
              },),
            )
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
              index=value;
              print(index);
              print(isActive);

            });
          },
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home_filled,),label: "",
              backgroundColor: Color(0xffffffff),
            ),
            BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Order.svg",color: isActive ? Color(0xff121212) :Color(0xffD1CFD5),),label: "", backgroundColor: Color(0xffffffff),),
            BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Heart.svg",
              color: isActive ?Color(0xff121212) :Color(0xffD1CFD5) ,),label: "", backgroundColor: Color(0xffffffff),),
            BottomNavigationBarItem(icon:Icon(Icons.notifications),label: "", backgroundColor: Color(0xffffffff),),
          ]),
    );
  }
}
