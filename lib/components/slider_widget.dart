import 'package:breathing_better/constants/color_constant.dart';
import 'package:breathing_better/shared_preferences/my_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SliderWidget extends StatefulWidget {
  final bool? isInhale;
  final bool? isHold;
  final bool? isExhale;
  double currentSliderValue;
  SliderWidget({
    Key? key,
    this.isInhale,
    this.isHold,
    this.isExhale,
    required this.currentSliderValue,
  }) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  //int currentValue = _currentSliderValue.toInt();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConstant.black,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: SizedBox(
              width: 300.w,
              child: Slider(
                activeColor: ColorConstant.white,
                value: widget.currentSliderValue,
                max: 60,
                divisions: 60,
                label: widget.currentSliderValue.round().toString(),
                onChanged: (double value) {
                  if (widget.isInhale != null && widget.isInhale!) {
                    MyPreference.saveInhale(value.toInt());
                  } else if (widget.isHold != null && widget.isHold!) {
                    MyPreference.saveHold(value.toInt());
                  } else if (widget.isExhale != null && widget.isExhale!) {
                    MyPreference.saveExhale(value.toInt());
                  } else {
                    MyPreference.saveNoOfCycle(value.toInt());
                  }
                  setState(() {
                    widget.currentSliderValue = value;
                    print(widget.currentSliderValue);
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w),
            child: Text(
              widget.currentSliderValue.toInt().toString(),
              style: TextStyle(fontSize: 30.sp, color: ColorConstant.white),
            ),
          ),
        ],
      ),
    );
  }
}
