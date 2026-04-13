import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/payment/payment_sucessful.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  final List<Map<String, String>> paymentDetails = [
    {"imagesSrc": "assets/images/mastercard.png", "title": "Mastercard"},
    {"imagesSrc": "assets/images/visa.png", "title": "Visa Card"},
    {"imagesSrc": "assets/images/paypal.png", "title": "Paypal"},
  ];
  int selectedIndex = 0;
  late int isSelected;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: Scaffold(
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
          title: Text("Payment Methods",style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w500,
            fontSize: 21.sp
          ),),
          centerTitle: true,
        ),
        backgroundColor: Color(0xffffffff),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15).r,
            child: Column(
              spacing: 25.h,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: paymentDetails.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                          print(selectedIndex);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10).r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10).r,
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffefefef),
                              blurRadius: 10,
                              offset: Offset(0, 8),
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 0
                            ),
                          ],
                        ),
                        width: 325.w,
                        height: 74.h,
                        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15,).r,
                        child: Row(
                          spacing: 15.w,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              paymentDetails[index]["imagesSrc"]!,
                              height: 28.h,
                              width: 44.w,
                            ),
                            Expanded(
                              child: Text(paymentDetails[index]["title"]!,style: TextStyle(
                                fontSize: 17.sp,
                                fontWeight: FontWeight.w300,
                                fontFamily: "Montserrat-Light"
                              ),),
                            ),
                            Container(
                              width: 24.w,
                              height: 24.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? Color(0xff3D3A45)
                                      : Color(0xffC5C6CF),
                                  width: isSelected ? 7.5.w : 2.w,
                                ),
                              ),
                              child: isSelected
                                  ? Center(
                                      child: Container(
                                        width: 9.w,
                                        height: 9.h,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff3D3A45),
                                          border: Border.all(
                                            width: 4.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                SizedBox(height: 5.h,),
                SizedBox(
                  height: 50.h,
                    width: double.infinity,
                    child: elevatedbtnwidget(text: "Pay Now", onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>
                          PaymentSucessful()));
                    },))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
