import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/payment/payment_methods.dart';
import 'package:gittest/screens/payment/payment_methods.dart';
// import 'package:gittest/screens/login.dart';
// import 'package:gittest/screens/populer-food.dart';
// import 'package:gittest/screens/product_details.dart';

import 'package:gittest/widgets/boxWidget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      designSize: Size(375, 948),
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: Color(0xffffffff),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4).r,
            child: Container(
              margin: EdgeInsets.all(3).r,
              // padding: EdgeInsets.all(10),
              height: 48.h,
              width: 48.w,
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
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, size: 20),
              ),
            ),
          ),
          title: Text("Popular Food"),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.all(8).r,
              padding: EdgeInsets.all(10).r,
              height: 48,
              width: 48,
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
              child: Icon(Icons.search_sharp, size: 28.sp),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15).r,
            child: Column(// mainAxisAlignment: MainAxisAlignment.start,
              spacing: 15.h,
              children: [
                boxWidget(
                  text: "Fresh Sandwitch",
                  discount: -30,
                  rate: 4.5,
                  image: "assets/images/fresh.jpg",
                  price: 10,
                ),
                boxWidget(
                  text: "Grilled Sandwitch",
                  discount: -60,
                  rate: 4.5,
                  image: "assets/images/grilled.jpg",
                  price: 10,
                ),
                Column(
                  spacing: 15.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Recepient Address",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      width: 335.w,
                      height: 144.h,
                      padding: EdgeInsets.symmetric(vertical: 25.h,horizontal:20.w),
                      decoration: BoxDecoration(
                        color: Color(0xffeeeef0),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Text(
                        "9224 Jailyn Terrace, block 2, North Maryjaneton, Tanzania, 4387242",
                        maxLines: 2,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                          height: 1.5.h,
                          fontFamily: 'Montserrat-Light',
                          fontWeight: FontWeight.w300,
                          fontSize: 17.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 15.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Review',
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontFamily: 'Montserrat-Light',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Full Vegie Salad (1 items)',
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat-Light',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Toasted Sandwich (1 items)',
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$10",
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat-Light',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Fee',
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "\$5",
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat-Light',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Discount',
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "-\$8",
                          style: TextStyle(
                            color: Color(0xff363D4E),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Montserrat-Light',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: TextStyle(
                            fontSize: 21.sp,
                            fontFamily: 'Montserrat-Bold',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "\$17",
                          style: TextStyle(
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat-Light',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.h,
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          PaymentMethods()));
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>PopularFood()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffeb6a58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                    ),
                    child: Text(
                      "Process to Payment",
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20.sp,
                        fontFamily: 'Montserrat-Light',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
