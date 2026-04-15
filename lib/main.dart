import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gittest/screens/Auth/login.dart';
import 'package:gittest/screens/Auth/signup.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gittest/screens/home/home.dart';
import 'package:gittest/screens/onboarding/splash_screen.dart';




void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        scrollBehavior: ScrollBehavior(),
        title: 'Food Popular',
        debugShowCheckedModeBanner: false,
          home: Home(),
      ),
    );
  }
}

