import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/connection_check/connection_controller.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/constants/image_path.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConnectionErrorScreen extends ConsumerWidget {
  const ConnectionErrorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(networkControllerProvider);
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) async {
        if (pop) {
          return;
        }
      },
      child: ReuseableScaffold(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
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
                  height: 20.h,
                ),
                // Text(
                //   "Check Connection",
                //   style: textTheme.bodyLarge!.copyWith(
                //     fontSize: title3,
                //     color: kPrimaryDarkColor,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                ReuseableButton(
                  bgcolor: kPrimaryVoiletColor,
                  textcolor: kvverylightColor,
                  text: "Check Connection",
                  ontap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
