import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class ReuseableButton extends StatelessWidget {
  VoidCallback? ontap;
  Color? bgcolor;
  String? text;
  Color? textcolor;
  ReuseableButton(
      {super.key, this.ontap, this.bgcolor, this.text, this.textcolor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: Size(300.w, 40.h),
          backgroundColor: bgcolor,
        ),
        onPressed: ontap,
        child: Text(
          text!,
          style: textTheme.bodyLarge!.copyWith(
            fontSize: title3,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
