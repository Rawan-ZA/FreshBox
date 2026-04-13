import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/screens/home/populer-food.dart';
import 'package:gittest/screens/home/product_details.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';
class OrderEmptyScreen extends StatefulWidget {
  const OrderEmptyScreen({super.key});

  @override
  State<OrderEmptyScreen> createState() => _OrderEmptyScreenState();
}

class _OrderEmptyScreenState extends State<OrderEmptyScreen> with SingleTickerProviderStateMixin {
  late TabController tabBar;
  int index = 0;
  bool isActive  = false;
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
              indicatorPadding:EdgeInsets.all(1).r ,
              dividerColor: Colors.transparent,
           indicatorColor: Color(0xff040C22),
              controller: tabBar,

                tabs: [
              Tab(
                child: Text('History',style: TextStyle(
                    color:Color(0xff121212),
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  fontSize: 17.sp,
                ),
                )
              ),
                  Tab(
                      child: Text('Upcoming',style: TextStyle(
                        color:Color(0xff121212),
                          fontFamily: "Montserrat",
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
                    padding:  EdgeInsets.all(10).r,
                    child: Column(
                      spacing: 20.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/Unhappy.svg",width: 157.w,height: 195.h,),
                        Text("Empty History",style:
                          TextStyle(
                            color: Color(0xff040C22),
                            fontSize:21.sp,
                            fontWeight:FontWeight.w500 ,
                            fontFamily: "Montserrate",
                          ),),
                        Text("You don't have a transaction \n history. Let’s Order Something",
                        style: TextStyle(
                          fontSize:15.sp,
                          fontWeight:FontWeight.w300 ,
                          fontFamily: "Montserrate-Light",
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.visible,),
                        SizedBox(height: 30.h,),
                       Row(
                         children:
                       [

                         Expanded(child:  SizedBox(
                           height: 50.h,
                          child: elevatedbtnwidget(text: "Order Now", onPressed: () {},)))
                       ],
                         )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(10).r,
                    child: Column(
                      spacing: 20.h,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/Unhappy.svg",width: 157.w,height: 195.h,),
                        Text("Empty History",style:
                        TextStyle(
                          color: Color(0xff040C22),
                          fontSize:21.sp,
                          fontWeight:FontWeight.w500 ,
                          fontFamily: "Montserrate-Bold",
                        ),),
                        Text("You don't have a transaction history. Let’s Order Something",
                          style: TextStyle(
                            fontSize:15.sp,
                            fontWeight:FontWeight.w300 ,
                            fontFamily: "Montserrate-Light",
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.visible,),
                        Row(children:
                        [
                          Expanded(child:  SizedBox(
                              height: 50.h,
                              child: elevatedbtnwidget(text: "Order Now", onPressed: () {},)))
                        ],
                        )
                      ],
                    ),
                  ),
                ]),
          ),
      ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Color(0xff121212),
          selectedItemColor: Color(0xff121212),
          iconSize: 26.sp,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index=value;
             index == 1 ? isActive = true ? index==2 :  isActive = true
                 : isActive =false;
              print(index);
              print(isActive);

            });
          },
          items:[
            BottomNavigationBarItem(icon:Icon(Icons.home_filled,),label: "", backgroundColor: Color(0xffffffff),),
            BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Order.svg",color: isActive ? Color(0xff121212) :Color(0xffD1CFD5),),label: "", backgroundColor: Color(0xffffffff),),
            BottomNavigationBarItem(icon:SvgPicture.asset("assets/images/Heart.svg",
              color: isActive ?Color(0xff121212) :Color(0xffD1CFD5) ,),label: "", backgroundColor: Color(0xffffffff),),
            BottomNavigationBarItem(icon:Icon(Icons.notifications),label: "", backgroundColor: Color(0xffffffff),),
          ]),
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
