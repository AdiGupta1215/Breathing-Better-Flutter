import 'package:flutter/animation.dart';

late AnimationController controller;
String get timerString {
  controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);
  Duration duration = controller.duration! * controller.value;
  return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
}
