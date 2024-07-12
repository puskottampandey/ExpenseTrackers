import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/connection_check/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  final Connectivity _connectivity = Connectivity();
  @override
  void initState() {
    super.initState();
    _connectivity.checkConnectivity().then((status) {
      if (status == ConnectivityResult.none) {
        context.push("/connectionscreen");
      } else {
        Timer(const Duration(seconds: 2), () {
          context.go("/onboarding");
        });
      }
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
        decoration: BoxDecoration(
          color: const Color(0xffFB52FF),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFB52FF),
              blurRadius: 10.r,
              spreadRadius: 10.r,
            )
          ],
        ),
      ),
    );
  }
}
