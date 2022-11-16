import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:breathing_better/components/appbar_widget.dart';
import 'package:breathing_better/components/custom_text_button.dart';

import '../../../constants/color_constant.dart';

class ExerciseInfo extends StatefulWidget {
  final String title;
  final String description;
  const ExerciseInfo({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  State<ExerciseInfo> createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(69.h), child: const AppBars()),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25.h),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.white,
                    fontSize: 32.sp),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              widget.description,
              style: TextStyle(
                  color: ColorConstant.white,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 22.sp),
            ),
            SizedBox(
              height: 475.h,
            ),
            CustomTextButton(
                title: "Back",
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
