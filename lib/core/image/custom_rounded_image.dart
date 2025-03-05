import 'package:expensetracker/core/constants/costant_assets.dart';
import 'package:expensetracker/core/image/custom_cache_network_image.dart';
import 'package:expensetracker/core/image/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomRoundedImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Widget? customPlaceHolder;
  final String fallBackImage;
  final bool isCached;
  const CustomRoundedImage({
    super.key,
    required this.height,
    required this.image,
    required this.width,
    this.customPlaceHolder,
    this.fallBackImage = Assets.placeholder,
    required this.isCached,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(500.r),
      child: isCached
          ? CustomCachedNetworkImage(
              url: image,
              height: height,
              width: width,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              // customPlaceHolder: customPlaceHolder,
              placeholder: fallBackImage,
            )
          : CustomNetWorkImage(
              url: image,
              height: height,
              width: width,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              placeholder: fallBackImage,
            ),
    );
  }
}
