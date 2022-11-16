import 'package:flutter/material.dart';

class MeditationImage extends StatelessWidget {
  const MeditationImage(
      {super.key, required double width, required double height});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/MeditationIcon_1.png");
  }
}
