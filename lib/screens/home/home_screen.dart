import 'package:breathing_better/components/appbar_widget.dart';
import 'package:breathing_better/components/exercise_button.dart';
import 'package:breathing_better/screens/home/exercise/custom_progression_screen.dart';
import 'package:breathing_better/screens/home/exercise/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(69.h), child: const AppBars()),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 16.h, left: 24.w, right: 16.w),
              child: Text(
                "Breathing Better is a mobile app to guide you through pranayamic breathing, which can relieve stress,improve lung function, energize you, and much more",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: ColorConstant.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal),
              )),
          Padding(
            padding: EdgeInsets.only(top: 86.h),
            child: Text(
              "Choose an exercise to get started:",
              style: TextStyle(
                  fontSize: 17.sp,
                  fontStyle: FontStyle.normal,
                  color: ColorConstant.white),
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          ExcerciseButton(
            title: "Ujjayi",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomProgression(
                    title: 'Ujjayi',
                    description:
                        'Ujjayi breathing is a technique that allows you to calm your mind by focusing on your breath\n\nTo practice ujjayi, inhale and exhale through the nose while very slightly constricting your throat. While there should be some resistance, you should not have any difficulty breathing. You\'ll know that you are performing the pranayama right if you hear a slight hissing noise while inhaling and exhaling, which is why this pranayama is also known as the "Ocean Breath"',
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ExcerciseButton(
            title: "4-7-8",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomProgression(
                    title: '4-7-8',
                    description:
                        '4-7-8 breathing is best for reducing acute anxiety because of its longer exhale and hold phases compared to its inhale phase\n\nTo practice 4-7-8 breathing, put a hand on your stomach before inhaling through your mouth. Make sure that you are expanding starting from your diaphragm and core instead of your chest.  Exhale through the mouth while focusing on relaxing one specific muscle at a time',
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ExcerciseButton(
            title: "Bhastrika",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomProgression(
                    title: 'Bhastrika',
                    description:
                        'Bhastrika breathing is a great practice to strengthen your lungs, clear congestion, and gain energy by increasing your body\'s oxygen supply\n\nTo practice Bhastrika, it is best to sit on your knees. First, sharply inhale through your nose while raising both hands above your head, then forcefully exhale while bringing your hands down to accentuate the exhale',
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ExcerciseButton(
            title: "Anulom Vilom",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomProgression(
                    title: 'Anulom Vilom',
                    description:
                        'Anulom Vilom breathing is a great technique to relieve stress and improve your natural breathing\n\nAnulom Vilom is a practice where you isolate your nostrils. To begin, bring your right hand to your nose and use your thumb to close your right nostril while you inhale from your left nostril. Then, lift your thumb from your right nostril and use your ring finger to close your left nostril while you exhale through your right nostril. Finally, alternate which nostril you inhale with and which nostril you exhale with for each cycle',
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          ExcerciseButton(
            title: "Custom",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
