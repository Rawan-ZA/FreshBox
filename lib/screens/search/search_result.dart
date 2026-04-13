import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gittest/screens/home/widgets/gridview_section.dart';
import 'package:gittest/screens/search/listview_search.dart';

import '../../widgets/elevatedbtnwidget.dart';
class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabBar;
  int currentIndex =0;
   bool isList = false;
  List<Map<String, String>> imagesSrc = [
    {"src": "assets/images/one.jpg", "title": "Coco berry Salad"},
    {"src": "assets/images/two.jpg", "title": "Marinated Grilled Burger"},
    {"src": "assets/images/three.jpg", "title": "Fresh Salad with Letuce"},
    {"src": "assets/images/four.jpg", "title": "Fresh Salad Green berry"},
  ];
  List<Map<String,String>> restaurantResult = [
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
  List<Map<String, String>> listviewContent = [
    {
      "image":"assets/images/bg1.jpg",
      "title" :"Salad Factory"
    },
    {
      "image":"assets/images/bg2.jpg",
      "title" :"Salad Factory"
    },
    {
      "image":"assets/images/bg3.jpg",
      "title" :"Salad Factory"
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
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: Color(0xffffffff),
          toolbarHeight: 100.h,
          title: SizedBox(
            height: 54.h,
              width: 255.w,
              child: TextField(
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal:10.w , vertical: 15.h).r,
                  label: Text("search"),
                  suffixIcon:Container(
                    width: 38.w,
                    height: 38.h,
                    // padding: EdgeInsets.all(15).r,
                    child: Icon(Icons.mic_none_rounded),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10).r,
                    boxShadow:  [ BoxShadow(
                        color: Color(0xffF4F4F5),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                  ],
                    ),
                  ),
                  prefixIcon:Icon(Icons.search_sharp),
                    focusedBorder: OutlineInputBorder(
                      borderSide:   BorderSide(
                            color: Color(0xffEB6A58),
                            width: 1.w
                        )
                    ),
                    enabledBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10).r,
                        borderSide: BorderSide(
                          color: Color(0xffEB6A58),
                        )
                    ) ,
                    border: OutlineInputBorder(


                )
                ) ,
              )),
          actions: [
            TextButton(onPressed: () {
              setState(() {
                isList=!isList;
              });
            }, child: Container(
             margin: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
             padding: EdgeInsets.all(12).r,
             height: 48.h,
             width: 48.w,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(15).r,
               boxShadow: [
                 BoxShadow(
                   color: Color(0xfffbe1de),
                   blurStyle: BlurStyle.outer,
                   blurRadius: 15,
                   offset: Offset(0, 3),
                 ),
               ],
             ),
             child: isList ?SvgPicture.asset("assets/images/grid.svg",fit: BoxFit.contain,
        width:20.w,height: 19.h,): SvgPicture.asset("assets/images/list.svg",fit: BoxFit.contain,
        width:20.w,height: 19.h,)),
            // PopupMenuButton(
            //   onSelected: (value) {
            //     print(value);
            //   },
            //   icon:  Container(
            //     margin: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
            //     padding: EdgeInsets.all(12).r,
            //     height: 48.h,
            //     width: 48.w,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(15).r,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color(0xfffbe1de),
            //           blurStyle: BlurStyle.outer,
            //           blurRadius: 15,
            //           offset: Offset(0, 3),
            //         ),
            //       ],
            //     ),
            //     child: SvgPicture.asset("assets/images/list.svg",fit: BoxFit.contain,
            //       width:20.w,height: 19.h,),
            //   ),
            //   itemBuilder: (context) {
            //   return [
            //     PopupMenuItem(
            //       onTap: () {
            //
            //       },
            //         child: Text("Grid")),
            //     PopupMenuItem(child: Text("ListView")),
            //   ];
            ),
          ],
      ),
        body:Column(
          spacing: 10.h,
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
                      child: Text('Food',style: TextStyle(
                        color: currentIndex == 0 ? Color(0xff121212) : Color(0xff8C8896),
                        fontFamily: currentIndex == 0 ? "Montserrat-Bold": "Montserrat",
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                      ),
                      )

                  ),
                  Tab(
                      child: Text('Restaurant',style: TextStyle(
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
                   isList ? ListviewSearch():  Padding(
                     padding:  EdgeInsets.all(20).r,
                     child: gridview_section(imagesSrc: imagesSrc),
                   ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:20.h,horizontal: 15.w),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listviewContent.length,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 325.w,
                            height: 222.h,
                            padding: EdgeInsets.symmetric(horizontal:5.h,vertical: 10.w),
                            margin: EdgeInsets.all(5).r,
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
                              spacing: 5.h,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Stack(
                                    children: [
                                      Image.asset(listviewContent[index]['image']!,
                                        width: 301.w,
                                        height: 132.h,
                                        fit: BoxFit.cover,),
                                      Text("", style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.sp,
                                          fontFamily: "Montserrat-Light"
                                      ),)
                                    ],
                                  ),
                                ),
                                Row(
                                  spacing: 10.w,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${listviewContent[index]['title']}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.sp,
                                          fontFamily: "Montserrat-Bold"
                                      ),),
                                    Row(
                                      spacing: 5.h,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SvgPicture.asset("assets/images/star.svg", width: 20.w,
                                          height: 20.h,color: Color(0xff5bc439) ,),
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff5bc439),
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],),
                                Row(
                                  spacing: 10.h,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("2464 Royal Ln.Mesa",style: TextStyle(
                                        color: Color(0xff3E3E3E99),
                                        fontFamily: "Montserrat-Light",
                                        fontSize: 15.09.sp,
                                        fontWeight: FontWeight.w500
                                    ),),
                                    Text("Open at 10.00AM",style: TextStyle(
                                        color: Color(0xffEB6A58),
                                        fontFamily: "Montserrat-Light",
                                        fontSize: 15.09.sp,
                                        fontWeight: FontWeight.w500
                                    ),),
                                  ],
                                )

                              ],
                            ),
                          );
                        },),
                    ),

                  ]),
            ),
        ],) ,
      ),
    );
  }
}
