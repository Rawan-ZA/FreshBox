import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/screens/home/favourite.dart';
import 'package:gittest/screens/home/notify.dart';
import 'package:gittest/screens/home/order_history.dart';
import 'package:gittest/screens/home/populer-food.dart';
import 'package:gittest/screens/home/widgets/floating_button.dart';
import 'package:gittest/screens/search/search.dart';
import 'package:gittest/screens/home/widgets/gridview_section.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;
  int index = 0;
  bool isActive  = false;
   List<Map<String, String>> tabBarContent = [
    {"imageSrc": "assets/images/dinner.png", "title": "Dinner"},
    {"imageSrc": "assets/images/lunch.png", "title": "Lunch"},
    {"imageSrc": "assets/images/breakfast.png", "title": "Breakfast"},
    {"imageSrc": "assets/images/snak.png", "title": "Snake"},
  ];
   List<Map<String, String>> stackInfo = [
    {
      "imagesSrc": "assets/images/sweet.png",
      "title": "Fresh Sweet Truth",
      "subTitle": "Bakery, Desserts",
      "price": "\$8.99",
    },
    {
      "imagesSrc": "assets/images/cake.png",
      "title": "Fresh Sweet Truth",
      "subTitle": "Bakery, Desserts",
      "price": "\$8.99",
    },
    {
      "imagesSrc": "assets/images/meat.png",
      "title": "Fresh Sweet Truth",
      "subTitle": "Bakery, Desserts",
      "price": "\$8.99",
    },
  ];
  List<Map<String, String>> imagesSrc = [
    {"src": "assets/images/one.jpg", "title": "Coco berry Salad"},
    // {"src": "assets/images/one.jpg", "title": "Coco berry Salad"},
    {"src": "assets/images/two.jpg", "title": "Marinated Grilled Burger"},

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
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
          extendBody: true,
        backgroundColor: Color(0xffffffff),
        body:
        index ==1 ? OrderHistory() :
        index == 2 ?Favourite() :
        index == 3 ?Notify() : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                SizedBox(height: 25.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 8.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Location",
                          style: TextStyle(
                            color: Color(0xff5C616F),
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat-Light",
                            fontSize: 13.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "9224 Jailyn Terrace, block 2",
                              style: TextStyle(
                                color: Color(0xff121212),
                                fontFamily: "Montserrat-Light",
                                fontWeight: FontWeight.w500,
                                fontSize: 17.sp,
                              ),
                            ),
                            Icon(Icons.arrow_back_ios_rounded, size: 14.sp),
                          ],
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10).r,
                      child: Image.asset(
                        "assets/images/profile.png",
                        height: 48.h,
                        width: 48.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 325.w,
                  height: 50.h,
                  child: TextField(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      Search(),));
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10).r,
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: Container(
                        width: 34.w,
                        height: 34.h,
                        padding: EdgeInsets.all(5).r,
                        margin: EdgeInsets.all(5).r,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(Icons.mic_none_rounded, size: 30.sp),
                      ),
                      prefixIcon: Icon(
                        Icons.search_sharp,
                        size: 24.sp,
                        color: Color(0xff121212),
                      ),
                      filled: true,
                      fillColor: Color(0xffedecee),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ).r,
                      hint: Text(
                        "what do you want to eat?",
                        style: TextStyle(
                          color: Color(0xff121212),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 441.w,
                  height: 25.h,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Color(0xff121212),
                    isScrollable: false,
                    labelPadding: EdgeInsets.zero,
                    indicatorWeight: 2.w,
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.only(top: 20.r),
                    // labelPadding: EdgeInsets.symmetric(horizontal: 12),
                    labelColor: Color(0xff3D3A45),
                    labelStyle: TextStyle(
                      fontFamily: "Montserrat-Light",
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                    ),
                    unselectedLabelColor: Color(0xff3D3A45),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15.sp,
                      fontFamily: "Montserrat-Light",
                    ),
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                        print(currentIndex);
                      });
                    },
                    tabs: [
                      Tab(child: Text("Featured")),
                      Tab(child: Text("Nearby")),
                      Tab(child: Text("Trending")),
                      Tab(child: Text("Newest")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 145.h,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tabBarContent.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              spacing: 10.h,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Image.asset(
                                    tabBarContent[index]['imageSrc']!,
                                    width: 81.w,
                                    height: 81.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  tabBarContent[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat-Light",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tabBarContent.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              spacing: 10.h,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Image.asset(
                                    tabBarContent[index]['imageSrc']!,
                                    width: 81.w,
                                    height: 81.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  tabBarContent[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat-Light",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tabBarContent.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              spacing: 10.h,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Image.asset(
                                    tabBarContent[index]['imageSrc']!,
                                    width: 81.w,
                                    height: 81.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  tabBarContent[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat-Light",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tabBarContent.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              spacing: 10.h,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10).r,
                                  child: Image.asset(
                                    tabBarContent[index]['imageSrc']!,
                                    width: 81.w,
                                    height: 81.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  tabBarContent[index]['title']!,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat-Light",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 211.h,
                  child: ListView.builder(
                    padding: EdgeInsetsGeometry.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: stackInfo.length,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5).r,
                        width: 300.w,
                        height: 211.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10).r,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  stackInfo[index]['imagesSrc']!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        Colors.grey.shade900,
                                        Colors.transparent,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 20.h,
                                left: 20.w,
                                right: 20.w,
                                child: Column(
                                  spacing: 10.w,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      stackInfo[index]['title']!,
                                      style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: "Montserrat-Light",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 21.sp,
                                      ),
                                    ),
                                    Row(
                                      spacing: 10.w,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          stackInfo[index]['subTitle']!,
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontFamily: "Montserrat-Light",
                                            fontWeight: FontWeight.w300,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Text(
                                          stackInfo[index]['price']!,
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontFamily: "Montserrat-Light",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 21.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Food",
                      style: TextStyle(
                        color: Color(0xff040C22),
                        fontWeight: FontWeight.w500,
                        fontSize: 21.sp,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    InkWell(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) =>
                           PopulerFood(),));
                      },
                      child: Container(
                        width: 80.w,
                        height: 30.h,
                        padding: EdgeInsets.all(5).r,
                        decoration: BoxDecoration(
                          color: Color(0xff171717),
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: Text(
                          "See All",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'Montserrat-Light',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                gridview_section(imagesSrc: imagesSrc,
                 scrollPhysics: NeverScrollableScrollPhysics(),
                                  ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Restaurant",
                      style: TextStyle(
                        color: Color(0xff040C22),
                        fontWeight: FontWeight.w500,
                        fontSize: 21.sp,
                        fontFamily: 'Montserrat-Bold',
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 30.h,
                      padding: EdgeInsets.all(5).r,
                      decoration: BoxDecoration(
                        color: Color(0xff171717),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Text(
                        "See All",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: 'Montserrat-Light',
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  padding: EdgeInsetsGeometry.all(0),
                  shrinkWrap: true,
                  itemCount: listviewContent.length,
                  physics: NeverScrollableScrollPhysics(),
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
                SizedBox(height:60.h,),
              ],
            ),
          ),
        ),
        floatingActionButton: floating_button(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape:  CircularNotchedRectangle(),
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color:Color(0xffD1CFD5),
                  width: 1.w
                )
              )
            ),
            height: 90.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30.w,
                      height: 3.h,
                      color: index == 0 ? Color(0xff121212) : Colors.transparent,
                    ),
                    IconButton(
                      icon: Icon(Icons.home_filled,
                          color: index == 0 ? Color(0xff121212) : Color(0xffD1CFD5)),
                      onPressed: () => setState(() => index = 0),
                    ),
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset("assets/images/Order.svg",
                      color: index == 1 ? Color(0xff121212) : Color(0xffD1CFD5)),
                  onPressed: () => setState(() => index = 1),
                ),

              SizedBox(width: 30.w),

                IconButton(
                  icon: SvgPicture.asset("assets/images/Heart.svg", color: index == 2 ? Color(0xff121212) : Color(0xffD1CFD5)),
                  onPressed: () => setState(() => index = 2),
                ),

                IconButton(
                  icon: Icon(Icons.notifications,
                      color: index == 3 ? Color(0xff121212) : Color(0xffD1CFD5)),
                  onPressed: () => setState(() => index = 3),
                ),
              ],
            ),
          ),
        ),
      )
      );

  }
}



