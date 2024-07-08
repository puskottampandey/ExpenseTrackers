import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ConfirmScreen extends ConsumerWidget {
  const ConfirmScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReuseableScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/Animation2.json"),
            Text(
              "Your email is on the way",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: title2,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Check your email test@test.com and follow the instructions to reset your password",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge!.copyWith(
                fontSize: regular2,
                color: kPrimarylightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            ReuseableButton(
              text: "Back to Login",
              bgcolor: kPrimaryVoiletColor,
              textcolor: kvverylightColor,
              ontap: () {
                context.go("/login");
              },
            )
          ],
        ),
      ),
    );
  }
}
