import 'package:breathing_better/components/appbar_widget.dart';
import 'package:breathing_better/components/circular_progress.dart';
import 'package:breathing_better/constants/color_constant.dart';
import 'package:breathing_better/screens/home/exercise/exercise_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/custom_text_button.dart';

class ExercisePage extends StatefulWidget {
  final int exhaleDuration;
  final int holdDuration;
  final int inhaleDuration;
  final int cycle;
  final String description;
  const ExercisePage({
    Key? key,
    required this.title,
    required this.description,
    required this.exhaleDuration,
    required this.holdDuration,
    required this.inhaleDuration,
    required this.cycle,
  }) : super(key: key);
  final String title;
  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorConstant.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(69.h),
          child: const AppBars(),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: ColorConstant.white,
                    fontSize: 32.sp,
                  ),
                ),
                IconButton(
                  color: ColorConstant.white,
                  icon: const Icon(Icons.info_outline_rounded),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseInfo(
                          title: widget.title,
                          description: widget.description,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Expanded(
              child: CountDownTimer(
                exhaleDuration: widget.exhaleDuration,
                holdDuration: widget.holdDuration,
                inhaleDuration: widget.inhaleDuration,
                cycle: widget.cycle,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 45.h),
              child: CustomTextButton(
                  title: "Back",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
