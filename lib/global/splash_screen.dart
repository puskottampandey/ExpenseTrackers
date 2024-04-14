import 'dart:async';
import 'dart:ui';

import 'package:expensetracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      context.go("/onboarding");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryVoiletColor,
      body: Stack(
        children: [
          blurCircle(),
          Center(
            child: Text(
              "Expense Tracker",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: kvverylightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center blurCircle() {
    return Center(
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration:  BoxDecoration(
          color:const Color(0xffFB52FF),
          borderRadius:const  BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color:const  Color(0xffFB52FF),
              blurRadius: 10.r,
              spreadRadius: 10.r,
            )
          ],
        ),
      ),
    );
  }
}
