import 'package:flutter/material.dart';
import 'package:gittest/screens/home/widgets/gridview_section.dart';
import '../../screens/payment/cart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/widgets/recommend_container.dart';

class PopulerFood extends StatelessWidget {
  List<Map<String, String>> imagesSrc = [
    {"src": "assets/images/one.jpg", "title": "Coco berry Salad"},
    {"src": "assets/images/two.jpg", "title": "Marinated Grilled Burger"},
    {"src": "assets/images/three.jpg", "title": "Fresh Salad with Letuce"},
    {"src": "assets/images/four.jpg", "title": "Fresh Salad Green berry"},
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(375, 1298),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Color(0xffffffff),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              height: 48,
              width: 48,
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, size: 20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
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
          ),
          title: Text("Popular Food"),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.all(8).r,
              padding: EdgeInsets.all(10).r,
              height: 48.h,
              width: 48.w,
              child: Icon(Icons.search_sharp, size: 28.sp),
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
        body: SingleChildScrollView(
          child: Column(
            spacing: 10.h,
            children: [
              Padding(
                padding: EdgeInsets.all(20).r,
                child: gridview_section(imagesSrc: imagesSrc,iconColor: Colors.grey,
                  iconSize:26,),),
              Padding(
                padding: EdgeInsets.all(15).r,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended",
                      style: TextStyle(
                        color: Color(0xff040C22),
                        fontWeight: FontWeight.w500,
                        fontSize: 21.sp,
                        fontFamily: 'Montserrat-Light',
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
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => cart()),
                          // );
                        },
                        child: Text(
                          "See All",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontFamily: 'Montserrat',
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.symmetric(horizontal: 0).r,
                // decoration: BoxDecoration(color: Color(0xffffffff)),
                child: Padding(
                  padding: const EdgeInsets.all(15).r,
                  child: Column(
                    spacing: 15.h,
                    children: [
                      recommended_container(
                        title: "Fresh Veg-Salad",
                        subTitle: "Fresh Salad with Green berry",
                        imageSrc: "assets/images/fruit.png",
                        price: "8.99",
                        backgroundColor: Color(0xfffbe1de),
                      ),
                      recommended_container(
                        title: "Veg Biryani",
                        subTitle: "Fresh Salad with Green berry",
                        imageSrc: "assets/images/rice.png",
                        price: "8.99",
                        backgroundColor: Color(0xfff8f9fc),
                      ),
                      recommended_container(
                        title: " Fresh Veg-Salad",
                        subTitle: "Fresh Salad with Green berry",
                        imageSrc: "assets/images/salad.png",
                        price: "12.99",
                        backgroundColor: Color(0xffe8e7ea),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xffffffff),
      ),
    );
  }
}


