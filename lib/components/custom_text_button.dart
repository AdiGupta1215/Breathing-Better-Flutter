import 'package:breathing_better/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 31.sp,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.normal,
            color: ColorConstant.white,
          ),
        ),
      ),
    );
  }
}
