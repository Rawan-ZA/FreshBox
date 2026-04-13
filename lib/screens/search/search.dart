import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gittest/screens/search/search_result.dart';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String,String>> searchContent =[
    {"value":"fried Sandwitch"},
    {"value":"japanese ramen"},
    {"value":"pizza mozzarella"},
    {"value":"boba tea"},
  ];
  List<String> populerSearch =[
    "Frid Chicken",'Macarons' ,"Chicken Satay"
    "Chocolate","Bulgogi","Tom Yum Soup","Taro Bobba Cheese"
  ];
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
              width: 325.w,
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
                ),
              )),
        body: Padding(
          padding:  EdgeInsets.all(20).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          SearchResult(),));
                    },
                  child: Text("Search History",
                    style: TextStyle(
                    color: Color(0xff040C22),
                    fontWeight: FontWeight.w500,
                    fontSize: 21.sp,
                    fontFamily: "Montserrat-Light"
                  ),),
                ),
                Text("Clear",
                  style: TextStyle(
                      color: Color(0xffF26333),
                      fontWeight: FontWeight.w500,
                      fontSize: 17.sp,
                      fontFamily: "Montserrat-Light"
                  ),
                ),],),
              ListView.builder(
                shrinkWrap: true,
                itemCount:searchContent.length,
                itemBuilder: (context, index) {
                return Column(
                  spacing: 15.h,
                  children: [
                    SizedBox(height: 10.h,),
                  Row(
                    spacing: 10.w,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       spacing: 10.w,
                       children: [
                       Icon(Icons.history_toggle_off),
                       Text("${searchContent[index]['value']}",
                       style: TextStyle(
                         color: Color(0xff363D4E),
                           fontWeight: FontWeight.w300,
                           fontSize: 17.sp,
                           fontFamily: "Montserrat-Light"
                       ),),
                     ],),
                      Icon(Icons.close),
                    ],
                  )
                ],);
              },),
              Text("Popular Search"),
                 SizedBox(height: 10.h),
                 Wrap(
                   spacing:10.w,
                   runSpacing: 15,
                   children: populerSearch.map((value){
                     return Container(
                       // margin: EdgeInsets.all(5).r,
                       padding: EdgeInsets.symmetric(horizontal:10.w,vertical: 2.h),
                       height:25.h ,
                       decoration: BoxDecoration(
                           color: Color(0xffD1CFD5),
                           borderRadius: BorderRadius.circular(6)
                       ),
                       child:Text(value,style: TextStyle(
                         fontSize: 13.sp,
                         fontWeight: FontWeight.w300,
                         fontFamily: "Montserrat"
                       ),),
                     );
                 }).toList(),
        ),
                     ],
                   ),
                 ),
          ),
    );
  }
}
