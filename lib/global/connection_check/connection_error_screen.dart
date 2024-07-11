import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/image_path.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              ImagePath.errorPage,
              height: 100.h,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Check Connection",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: title3,
                color: kPrimaryDarkColor,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
