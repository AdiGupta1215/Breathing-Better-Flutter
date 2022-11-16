import 'dart:async';

import 'package:breathing_better/constants/color_constant.dart';
import 'package:breathing_better/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstant.black,
      child: Center(child: Image.asset("assets/images/MeditationIcon_1.png")),
    ); //<- Creates a widget that displays an image.
  }
}
