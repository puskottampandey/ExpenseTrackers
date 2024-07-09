import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      child: Center(
        child: SvgPicture.asset(
          "assets/images/Ilustration.svg",
          height: 60.h,
        ),
      ),
    );
  }
}
