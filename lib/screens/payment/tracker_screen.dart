// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:google_maps/google_maps.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart' hide LatLng;
// class TrackerScreen extends StatefulWidget {
//   const TrackerScreen({super.key});
//
//   @override
//   State<TrackerScreen> createState() => _TrackerScreenState();
// }
//
// class _TrackerScreenState extends State<TrackerScreen> {
//   final Completer<GoogleMapController> _controller =
//   Completer<GoogleMapController>();
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.7749, -122.4194),
//     zoom: 14.4746,
//   );
//
//   static final CameraPosition _kLake = CameraPosition(
//     bearing: 192.8334901395799,
//     target: LatLng(37.43296265331129, -122.08832357078792),
//     tilt: 59.440717697143555,
//     zoom: 19.151926040649414,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//     );
//   }
//   Future<void> _goToTheLake() async {
//     final GoogleMapController controller = await _controller.future;
//     await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gittest/widgets/elevatedbtnwidget.dart';
import 'package:latlong2/latlong.dart';
class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        child: Scaffold(
          body:Stack(
            children: [
              Container(
                width: double.infinity.w,
                height: 800.h,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(32.22111, 35.25444),
                    initialZoom: 13,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'my_flutter_app',
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15).r,
                        width: 333.w,
                        height: 285.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12).r,
                          color: Color(0xffffffff)
                        ),
                        child:Padding(
                          padding:  EdgeInsets.all(15).r,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 25.h,
                            children: [
                              Text("Starbucks Order",style:
                                TextStyle(
                                  fontFamily: "Montserrat-Light",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21.sp,
                                ),),
                              Row(
                                spacing: 10.w,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                SvgPicture.asset("assets/images/time.svg",),
                                Text("Your delivery time",style: TextStyle(
                                  color: Color(0xff8C8896),
                                  fontSize: 15.5.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat"
                                ),),
                                Text("30 minutes",style: TextStyle(
                                    color: Color(0xff121212),
                                    fontSize: 13.3.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Montserrat-Light"
                                ),),
                              ],),
                              Row(
                                spacing: 10.w,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset("assets/images/location.svg"),
                                  Text("Your Address",style: TextStyle(
                                      color: Color(0xff8C8896),
                                      fontSize: 15.5.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat"
                                  ),),
                                  Expanded(
                                    child: Text("9224 Jailyn Terrace, block 2",
                                      overflow: TextOverflow.visible,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xff121212),
                                        fontSize: 13.3.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat-Light"
                                    ),),
                                  ),
                                ],),
                              Row(
                                spacing: 15.w,
                                children: [
                                ClipRRect(child: Image.asset("assets/images/porf.jpg",
                                  width: 42.w,height: 42.h,fit: BoxFit.cover,),
                                borderRadius: BorderRadius.circular(12).r,),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 229.w,
                                    height: 44.4.h,
                                    decoration: BoxDecoration(
                                      color: Color(0xff121212),
                                      borderRadius: BorderRadius.circular(8.8).r
                                    ),
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      spacing: 10.w,
                                      children: [
                                      SvgPicture.asset("assets/images/Calling.svg"),
                                      Text("Call Smith",style: TextStyle(
                                        color: Color(0xffffffff),
                                        fontFamily: "Montserrat-Bold",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.6.sp
                                      ),),
                                    ],),
                                  ),
                                )
                              ],)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

