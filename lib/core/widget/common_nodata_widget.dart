import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonNoDataWidget extends StatelessWidget {
  final String message;
  final String svgUrl;
  final double height;
  final double width;
  const CommonNoDataWidget({
    super.key,
    this.message = "",
    this.svgUrl = "",
    this.height = 100,
    this.width = 100,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          AspectRatio(
            aspectRatio: 2,
            child: SvgPicture.asset(
              svgUrl,
              height: height,
              width: width,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Text((message.isNotEmpty) ? message : "Data not found"),
        ],
      ),
    );
  }
}
