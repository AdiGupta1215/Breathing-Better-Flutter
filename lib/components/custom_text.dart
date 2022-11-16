import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constant.dart';

class CustomSubTitle extends StatelessWidget {
  const CustomSubTitle({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.w),
      child: Text(
        subtitle,
        style: TextStyle(
            fontSize: 17.sp,
            color: ColorConstant.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
          color: ColorConstant.white,
          fontSize: 32.sp),
    );
  }
}
