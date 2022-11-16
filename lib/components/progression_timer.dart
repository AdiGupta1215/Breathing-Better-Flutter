import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constant.dart';

class ProgressionTimer extends StatefulWidget {
  final int timeDuration;
  String title;

  ProgressionTimer({
    Key? key,
    required this.timeDuration,
    required this.title,
  }) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<ProgressionTimer>
    with TickerProviderStateMixin {
  late AnimationController controller;

  String get timerString {
    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.timeDuration),
    );

    // controller.addListener(() {
    //   if (int.parse(timerString.replaceAll(":", "")) == 0) {
    //     title = "Hold";
    //     setState(() {});
    //   }
    // });
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstant.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 150.h,
          width: 400.w,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: ColorConstant.black,
                fontSize: 18.sp),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: 22.h, bottom: 1.h, left: 1.w, right: 1.w),
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
                style: TextStyle(fontSize: 71.sp, color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
