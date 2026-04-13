import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/payment/cart.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late TextEditingController instructionController;
  int counter = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    instructionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    instructionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 948),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          toolbarHeight: 70.h,
          backgroundColor: Color(0xffffffff),
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4).r,
            child: Container(
              margin: EdgeInsets.all(3).r,
              padding: EdgeInsets.all(10).r,
              alignment: Alignment.center,
              height: 48.h,
              width: 48.w,
              child: Center(
                child: Icon(Icons.arrow_back_ios_rounded, size: 20.sp),
              ),
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
          ),
          title: Text("Popular Food"),
          centerTitle: true,
          actions: [
            Container(
              margin: EdgeInsets.all(8).r,
              padding: EdgeInsets.all(10).r,
              height: 48.h,
              width: 48.w,
              child: Icon(Icons.more_vert, size: 28.sp),
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
          child: Padding(
            padding: const EdgeInsets.all(20).r,
            child: Column(
              spacing: 15.h,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10).r,
                  child: Image.asset("assets/images/fresh.jpg"),
                ),
                Column(
                  spacing: 15.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 20.h,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Text(
                            "Authentic Japanese Fresh Sandwitch",
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 21.sp,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                        Text(
                          "\$12",
                          style: TextStyle(
                            color: Color(0xffF26333),
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                            fontSize: 27.sp,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Lorem ipsum et dolor sit amet, and consectetur eadipiscing elit. Ametmo magna the cursus yum dolor praesenta the  pulvinar tristique the food.",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: "Montserrat-Light",
                        fontWeight: FontWeight.w400,
                        color: Color(0xff3D3A45),
                        height: 1.7.h,
                      ),
                    ),
                    Text(
                      "Review",
                      style: TextStyle(
                        color: Color(0xff121212),
                        fontWeight: FontWeight.w500,
                        fontSize: 17.sp,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 100.h,
                        // width: 350.w,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(10).r,
                          children: List.generate(
                            5,
                            (index) => listViewItems(index),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Instructions",
                          style: TextStyle(
                            color: Color(0xff121212),
                            fontSize: 17.sp,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextField(
                          controller: instructionController,
                          maxLines: 10,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xffeeeef0),
                            hint: Text(
                              "Write Instructions",
                              style: TextStyle(
                                color: Color(0xff8C8896),
                                fontSize: 16.sp,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10).r,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                    Row(
                      spacing: 10.w,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10.w,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter--;
                                  if(counter < 0){
                                      counter =0;
                                  }
                                  print("$counter clicked");
                                });
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffD1CFD5),
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                                child: Icon(
                                  Icons.remove,
                                  size: 23.sp,
                                  color: Color(0xff363D4E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              width: 30.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10).r,
                              ),
                              child: Text(
                                "$counter",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff121212),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  counter++;
                                  print("$counter clicked");
                                });
                              },
                              child: Container(
                                width: 50.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Color(0xffD1CFD5),
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 23,
                                  color: Color(0xff363D4E),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 45.h,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => Cart()),
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffEB6A58),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10).r,
                                ),
                              ),
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  fontFamily: "Montserrat",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  //custom widget
  Widget listViewItems(int i) {
    List images = [
      "assets/images/beans.jpg",
      "assets/images/egg.jpg",
      "assets/images/corn.jpg",
      "assets/images/greens.jpg",
      "assets/images/tomato.jpg",
    ];
    return Padding(
      padding: EdgeInsets.all(10).r,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          images[i],
          width: 52.w,
          height: 49.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
