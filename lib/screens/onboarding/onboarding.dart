import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Auth/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});
  @override
  State<Onboarding> createState() => _Onboarding();
}

class _Onboarding extends State<Onboarding> {
  late PageController pageController;
  int totalPages = 3;
  int currentPage = 0;
  List<Map<String,String>> pageContent =[
    {"image":"assets/images/onboarding.png",
    "title":"Order Food Around You",
    "subtitle":"When you oder, we’ll hook you up with exclusive coupon, specials and rewards"
    },
    {"image":"assets/images/onboarding2.png",
      "title":"Receive the Great Food",
      "subtitle":"You’ll receive the great food within a hour. And get free delivery credits for every order."
    },
    {"image":"assets/images/onboarding3.png",
      "title":"Hot Delivery to Home",
      "subtitle":"We make food ordering fasr, simple and free-no matter if you order online or cash"
    },
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Padding(
          padding: EdgeInsets.all(10).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15.h,
            children: [
              SizedBox(height: 60.h,),
              Image.asset("assets/images/mainLogo.png",width: 144.w,height: 22.h,),
              SizedBox(height: 20.h,),
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: pageContent.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  }, itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Image.asset("${pageContent[index]["image"]}",
                          height: 300.h,
                          width: 250.w,fit: BoxFit.contain,),
                        Text("${pageContent[index]["title"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Montserrat-Bold",
                  fontSize: 27.sp,),
                        ),
                        Text("${pageContent[index]["subtitle"]}",
                  style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: "Montserrat-Light",
                  fontWeight: FontWeight.w300,
                  color: Color(0xff5C616F),
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  ),
                      ],
                    );
                },
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotWidth: 10,
                      dotHeight: 8,
                      expansionFactor: 3,
                      radius: 4,
                      spacing: 6,
                      dotColor: Color(0xffD6DFFF),
                      activeDotColor: Color(0xff121212),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25).r,
                child: currentPage != totalPages - 1
                    ? InkWell(
                  onTap: () {
                    // pageController.jumpToPage(totalPages - 1);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20).r,
                    child: Row(
                      spacing: 5.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skip",
                          style: TextStyle(
                            color: Color(0xff121212),
                            fontWeight: FontWeight.w500,
                            fontSize: 17.sp,
                            fontFamily: "Montserrat-Bold",
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if(currentPage < totalPages-1){
                              pageController.nextPage(duration: Duration(seconds: 3),
                                curve: Curves.ease,);
                            }
                          },
                          child: Container(
                            width: 137.w,
                            height: 50.h,
                            padding: EdgeInsets.all(15).r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10).r,
                              color: Color(0xff121212),
                            ),
                            child: Text(
                              "Next",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xffffffff),
                                fontSize: 21.sp,
                                height: 1,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat-light",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:
                        (context) => Login(),));
                  },
                  child: Padding(
                    padding:  EdgeInsets.all(20).r,
                    child: Container(
                      width: 325.w,
                      height: 50.h,
                      padding: EdgeInsets.all(15).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10).r,
                        color: Color(0xff121212),
                      ),
                      child: Text(
                        "Get Started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 21.sp,
                          height: 1,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat-Bold",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
