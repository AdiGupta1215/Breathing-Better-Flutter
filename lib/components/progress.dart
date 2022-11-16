// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../constants/color_constant.dart';

// class CountDownTimer extends StatefulWidget {
//   const CountDownTimer({super.key});

//   @override
//   CountDownTimerState createState() => CountDownTimerState();
// }

// class CountDownTimerState extends State<CountDownTimer> {
//   late Timer timer;
//   late String title;
//   double progressValues = 1;
//   int loop = 7;

//   @override
//   void initState() {
//     //? Start the timer that ticks every 1 second
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//       _handleTick,
//     );
//     title = "Inhale";
//     super.initState();
//   }

//   void _handleTick(Timer _) {
//     //? reduce the progress values
//     setState(() => progressValues = progressValues - (1 / loop));
//     if (progressValues == 0) {
//       //? when timer is finished
//       timer.cancel();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300.h,
//       width: 300.h,
//       child: Stack(children: <Widget>[
//         // Align(
//         //   alignment: Alignment.bottomCenter,
//         //   child: Container(
//         //     height: MediaQuery.of(context).size.height,
//         //   ),
//         // ),
//         Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Align(
//                   alignment: FractionalOffset.center,
//                   child: AspectRatio(
//                     aspectRatio: 1.0,
//                     child: Stack(
//                       children: <Widget>[
//                         Positioned.fill(
//                           child: SizedBox(
//                             // height: 350,
//                             // width: 350,
//                             child: CircularProgressIndicator(
//                               value: progressValues,
//                               color: Colors.white,
//                               strokeWidth: 18,
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: FractionalOffset.center,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     top: 15.h,
//                                     left: 15.w,
//                                     right: 15.w,
//                                     bottom: 15.h),
//                                 child: Image.asset(
//                                   "assets/images/MeditationIcon_1.png",
//                                   height: 200.h,
//                                   width: 200.w,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   )),
//               Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: ColorConstant.white,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     height: 150.h,
//                     width: 400.w,
//                     child: Text(
//                       title,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: ColorConstant.black,
//                           fontSize: 18.sp),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         top: 22.h, bottom: 1.h, left: 1.w, right: 1.w),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: ColorConstant.black,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       height: 127.h,
//                       width: 400.w,
//                       child: Center(
//                           // child: Text(
//                           //   timerString,
//                           //   style: TextStyle(
//                           //       fontSize: 71.sp, color: Colors.white),
//                           // ),
//                           ),
//                     ),
//                   )
//                 ],
//               ),
//             ])
//       ]),
//     );
//   }
// }
