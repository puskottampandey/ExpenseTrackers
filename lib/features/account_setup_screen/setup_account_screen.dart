import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AccountSetUp extends StatelessWidget {
  const AccountSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Let’s setup your account!",
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: title2,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Account can be your bank, credit card or your wallet.",
                style: textTheme.bodyLarge!.copyWith(
                    fontSize: regular2,
                    color: kPrimaryDarkColor,
                    fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ReuseableButton(
                    text: "Let's go",
                    textcolor: kvverylightColor,
                    bgcolor: kPrimaryVoiletColor,
                    ontap: () {
                      context.push(("/addnewaccount"));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
