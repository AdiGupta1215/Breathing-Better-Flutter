import 'dart:math' as math;

import 'package:breathing_better/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountDownTimer extends StatefulWidget {
  final int inhaleDuration;
  final int holdDuration;
  final int exhaleDuration;
  final int cycle;

  const CountDownTimer({
    super.key,
    required this.inhaleDuration,
    required this.holdDuration,
    required this.exhaleDuration,
    required this.cycle,
  });

  CountDownTimerState createState() => CountDownTimerState();
}

class CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin {
  @override
  bool isInhaleComplete = false;
  bool isHoldComplete = false;
  bool isExhaleComplete = false;

  late AnimationController controller;
  late String title;
  late int cycle;

  String get timerString {
    Duration duration = controller.duration! * controller.value;
    final secs = duration.inSeconds % 60;
    return '${duration.inMinutes}:${secs.toString().padLeft(2, '0')}';
  }

  void _configAnimationController(int seconds) {
    try {
      controller.stop();
      controller.removeListener(_controllerListener);
    } catch (_) {
      //? here first time error will be thrown
      //? because controller has not initialize at first time
      //? so just catching error, no need to handle
    }
    controller = AnimationController(
      value: 1,
      vsync: this,
      duration: Duration(seconds: seconds),
    );
    controller.addListener(_controllerListener);
    controller.reverse();
  }

  void _controllerListener() {
    if (controller.value == 0) {
      if (isInhaleComplete) {
        if (isHoldComplete) {
          if (isExhaleComplete) {
            controller.stop();
          } else {
            cycle -= 1;
            if (cycle > 0) {
              setState(() {
                isInhaleComplete = false;
                isHoldComplete = false;
                isExhaleComplete = false;
                title = "Inhale";
                _configAnimationController(widget.inhaleDuration);
              });
            } else {
              setState(() {
                isExhaleComplete = true;
                title = "Done";
              });
            }
          }
        } else {
          setState(() {
            isHoldComplete = true;
            title = "Exhale";
            _configAnimationController(widget.exhaleDuration);
          });
        }
      } else {
        setState(() {
          isInhaleComplete = true;
          title = "Hold";
          _configAnimationController(widget.holdDuration);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    cycle = widget.cycle;
    title = "Inhale";
    _configAnimationController(widget.inhaleDuration);
  }

  @override
  void dispose() {
    controller.removeListener(_controllerListener);
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height:
                          controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 70.h, left: 90.w, right: 90.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: FractionalOffset.center,
                          child: AspectRatio(
                            aspectRatio: 1.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: CustomPaint(
                                      painter: CustomTimerPainter(
                                    animation: controller,
                                    backgroundColor: Colors.white,
                                    color: ColorConstant.black,
                                  )),
                                ),
                                Align(
                                  alignment: FractionalOffset.center,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.h,
                                            left: 15.w,
                                            right: 15.w,
                                            bottom: 15.h),
                                        child: Image.asset(
                                          "assets/images/MeditationIcon_1.png",
                                          height: 180.h,
                                          width: 180.w,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 150.h,
                              width: 400.w,
                              child: Builder(builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, rebuild) {
                                  return Text(
                                    title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: ColorConstant.black,
                                        fontSize: 18.sp),
                                  );
                                });
                                // return Text(
                                //   title,
                                //   textAlign: TextAlign.center,
                                //   style: TextStyle(
                                //       fontWeight: FontWeight.w600,
                                //       color: ColorConstant.black,
                                //       fontSize: 18.sp),
                                // );
                              }),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 22.h,
                                  bottom: 1.h,
                                  left: 1.w,
                                  right: 1.w),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                height: 127.h,
                                width: 400.w,
                                child: Center(
                                  child: Text(
                                    timerString,
                                    style: TextStyle(
                                        fontSize: 71.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorConstant.white
      ..strokeWidth = 13.8
      //..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
