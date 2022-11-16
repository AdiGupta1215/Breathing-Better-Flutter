import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constant.dart';

class ExcerciseButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ExcerciseButton(
      {super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: Padding(
        padding: EdgeInsets.only(left: 86.w, right: 86.w),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 22.sp,
                  color: ColorConstant.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
