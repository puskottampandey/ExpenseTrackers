import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewAccount extends StatelessWidget {
  const AddNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      changeColor: true,
      color: kPrimaryVoiletColor,
      appbar: true,
      text: "Add New Account",
      child: Column(
        children: [
          const Spacer(),
          Text(
            "Rs.0000.000",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: regular2,
              color: kPrimarylightColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: kvverylightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r))),
            height: 300.h,
          )
        ],
      ),
    );
  }
}
