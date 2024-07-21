import 'dart:async';

import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/constants/image_path.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SuccessScreen extends ConsumerStatefulWidget {
  const SuccessScreen({super.key});

  @override
  ConsumerState<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends ConsumerState<SuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      context.go("/homescreen");
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.successLogo,
              height: 80.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "You are set!",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: title3,
                color: kPrimaryDarkColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
