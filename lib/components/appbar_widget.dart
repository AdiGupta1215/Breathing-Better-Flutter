import 'package:breathing_better/constants/meditation_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constant.dart';

class AppBars extends StatefulWidget {
  const AppBars({super.key});

  @override
  State<AppBars> createState() => _AppBarsState();
}

class _AppBarsState extends State<AppBars> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      child: AppBar(
        backgroundColor: ColorConstant.black, leadingWidth: 35.w,
        leading: MeditationImage(
          height: 37.h,
          width: 35.w,
        ),

        actions: [
          Image.asset(
            "assets/images/app_icon.png",
            height: 24.h,
            width: 44.w,
          ),
        ],
        // ignore: prefer_const_constructors
        shape: Border(
          bottom: BorderSide(color: ColorConstant.white, width: 1.h),
        ),
      ),
    );
  }
}
