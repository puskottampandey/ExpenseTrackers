import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/constants.dart';

// ignore: must_be_immutable
class ReuseableButton extends StatelessWidget {
  final VoidCallback? ontap;
  final Color? bgcolor;
  final String? text;
  final Color? textcolor;
  final Size? minimumsize;
  final bool? widgetextra;
  final Widget? child;
  ReuseableButton({
    super.key,
    this.ontap,
    this.bgcolor,
    this.widgetextra = false,
    Size? minimumSize,
    this.child,
    this.text,
    this.textcolor,
  }) : minimumsize = minimumSize ?? Size(double.infinity, 40.h);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          minimumSize: minimumsize,
          backgroundColor: bgcolor,
        ),
        onPressed: ontap,
        child: widgetextra!
            ? child
            : Text(
                text!,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: regular2,
                  color: textcolor,
                  fontWeight: FontWeight.w600,
                ),
              ));
  }
}
