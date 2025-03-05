import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonErrorWidget extends StatelessWidget {
  final String message;
  final String svgUrl;
  final double height;
  final double width;
  final bool hideImage;
  final Widget? child;
  const CommonErrorWidget({
    super.key,
    required this.message,
    this.svgUrl = "",
    this.height = 100,
    this.width = 100,
    this.hideImage = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          if (!hideImage)
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
          child == null ? Text(message) : child!,
        ],
      ),
    );
  }
}
