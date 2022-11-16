import 'package:breathing_better/components/custom_text.dart';
import 'package:breathing_better/components/custom_text_button.dart';
import 'package:breathing_better/components/slider_widget.dart';
import 'package:breathing_better/screens/home/exercise/custom_progression_screen.dart';
import 'package:breathing_better/screens/home/home_screen.dart';
import 'package:breathing_better/shared_preferences/my_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/appbar_widget.dart';
import '../../../constants/color_constant.dart';

class CustomScreen extends StatefulWidget {
  const CustomScreen({super.key});

  @override
  State<CustomScreen> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(69.h), child: const AppBars()),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              "Custom",
              style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  color: ColorConstant.white,
                  fontSize: 32.sp),
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          const CustomSubTitle(subtitle: "Inhale Duration"),
          SizedBox(
            height: 10.h,
          ),
          SliderWidget(
            isInhale: true,
            currentSliderValue: (MyPreference.getInhale() ?? 0).toDouble(),
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomSubTitle(subtitle: "Hold Duration"),
          SizedBox(
            height: 10.h,
          ),
          SliderWidget(
            isHold: true,
            currentSliderValue: (MyPreference.getHold() ?? 0).toDouble(),
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomSubTitle(subtitle: "Exhale Duration"),
          SizedBox(
            height: 10.h,
          ),
          SliderWidget(
            isExhale: true,
            currentSliderValue: (MyPreference.getExhale() ?? 0).toDouble(),
          ),
          SizedBox(
            height: 15.h,
          ),
          const CustomSubTitle(subtitle: "Number of Cycles"),
          SizedBox(
            height: 10.h,
          ),
          SliderWidget(
            currentSliderValue: (MyPreference.getNoOfCycle() ?? 0).toDouble(),
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextButton(
            title: "Save & Start",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomProgression(
                    title: 'Custom',
                    description: '',
                    isCustom: true,
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomTextButton(
            title: "Back",
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
