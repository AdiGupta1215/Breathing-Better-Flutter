import 'package:breathing_better/components/custom_text_button.dart';
import 'package:breathing_better/components/progression_timer.dart';
import 'package:breathing_better/constants/color_constant.dart';
import 'package:breathing_better/screens/home/exercise/exercise_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared_preferences/my_preference.dart';

class CustomProgression extends StatefulWidget {
  const CustomProgression({
    Key? key,
    required this.title,
    required this.description,
    this.isCustom = false,
  }) : super(key: key);
  final String title;
  final String description;
  final bool isCustom;
  @override
  State<CustomProgression> createState() => _CustomProgressionState();
}

class _CustomProgressionState extends State<CustomProgression> {
  late int inhaleDuration;
  late int holdDuration;
  late int exhaleDuration;
  late int cycle;

  @override
  void initState() {
    super.initState();
    cycle = widget.isCustom ? (MyPreference.getNoOfCycle() ?? 1) : 1;
    inhaleDuration = widget.isCustom ? (MyPreference.getInhale() ?? 0) : 7;
    holdDuration = widget.isCustom ? (MyPreference.getHold() ?? 0) : 7;
    exhaleDuration = widget.isCustom ? (MyPreference.getExhale() ?? 0) : 7;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.black,
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: ColorConstant.white,
                    size: 32.sp,
                  ),
                ),
                SizedBox(
                  width: 50.w,
                ),
                const Text("Progression",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: ColorConstant.white,
                        fontSize: 32)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 90.w, right: 90.w),
            child: Column(children: [
              SizedBox(height: 32.h),
              ProgressionTimer(
                timeDuration: (widget.isCustom) ? inhaleDuration : 7,
                title: 'Inhale',
              ),
              SizedBox(height: 10.h),
              const Icon(
                Icons.arrow_downward_rounded,
                color: ColorConstant.white,
                size: 40,
              ),
              SizedBox(height: 10.h),
              ProgressionTimer(
                timeDuration: (widget.isCustom) ? holdDuration : 7,
                title: 'Hold',
              ),
              SizedBox(height: 10.h),
              const Icon(
                Icons.arrow_downward_rounded,
                color: ColorConstant.white,
                size: 40,
              ),
              SizedBox(height: 10.h),
              ProgressionTimer(
                timeDuration: (widget.isCustom) ? exhaleDuration : 7,
                title: 'Exhale',
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextButton(
                  title: 'Start',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ExercisePage(
                            title: widget.title,
                            description: widget.description,
                            exhaleDuration: exhaleDuration,
                            holdDuration: holdDuration,
                            inhaleDuration: inhaleDuration,
                            cycle: cycle,
                          ),
                        ));
                  })
            ]),
          )
        ]));
  }
}
