import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerContainer extends StatelessWidget {
  final double height;
  final double? width;
  final double bottomMargin;
  final double borderRadius;
  final double rightMargin;
  final double leftMargin;

  const ShimmerContainer({
    super.key,
    this.borderRadius = 4,
    required this.bottomMargin,
    required this.height,
    required this.width,
    this.rightMargin = 0,
    this.leftMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final customColors = theme.extension<CustomThemeExtension>()!;
    return Container(
      margin: EdgeInsets.only(
          bottom: bottomMargin, right: rightMargin, left: leftMargin),
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: customColors.warningColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class ListViewPlaceHolder extends StatelessWidget {
  final int numberOfItem;
  final double? itemHeight;
  final double horizontalPadding;
  const ListViewPlaceHolder({
    super.key,
    this.itemHeight,
    this.numberOfItem = 10,
    this.horizontalPadding = 15,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomThemeExtension>()!;
    final _isLightMode = UiUtils.isLightMode(theme);

    return Shimmer.fromColors(
      baseColor:
          _isLightMode ? CustomColors.lightGray : CustomColors.darkerGrey,
      highlightColor:
          _isLightMode ? theme.scaffoldBackgroundColor : CustomColors.darkGrey,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            numberOfItem,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ShimmerContainer(
                bottomMargin: 0,
                leftMargin: horizontalPadding.w,
                height: itemHeight ?? 100.h,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
                rightMargin: horizontalPadding.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImageLoader extends StatelessWidget {
  final double height;
  final double width;

  const ImageLoader({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return Shimmer.fromColors(
        baseColor: customColors.warningColor,
        highlightColor: Colors.white,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ShimmerContainer(
                bottomMargin: 0,
                // leftMargin: 15,
                height: height,
                width: width,
                borderRadius: 100,
                rightMargin: 0.w),
          ),
        ));
  }
}

class GridViewPlaceHolder extends StatelessWidget {
  final int length;
  final double verticalPadding;
  final double itemHeight;
  final int itemInRow;
  final double itemBorderRadius;
  const GridViewPlaceHolder(
      {super.key,
      this.length = 3,
      this.verticalPadding = 10,
      this.itemHeight = 90,
      this.itemInRow = 2,
      this.itemBorderRadius = 10});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return Shimmer.fromColors(
        baseColor: customColors.warningColor,
        highlightColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                length,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: verticalPadding.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        itemInRow,
                        (index) => Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: ShimmerContainer(
                                  bottomMargin: 0,
                                  height: itemHeight.h,
                                  width: MediaQuery.of(context).size.width,
                                  borderRadius: itemBorderRadius,
                                ),
                              ),
                              SizedBox(width: index != itemInRow - 1 ? 10 : 0),
                            ],
                          ),
                        ),
                      )

                      // [
                      //   Expanded(
                      //     child: ShrimmerContainer(
                      //       bottomMargin: 0,
                      //       height: itemHeight.hp,
                      //       width: MediaQuery.of(context).size.width,
                      //       borderRadius: 10.wp,
                      //     ),
                      //   ),
                      //   SizedBox(width: 10.wp),
                      //   Expanded(
                      //     child: ShrimmerContainer(
                      //       bottomMargin: 0,
                      //       height: itemHeight.hp,
                      //       width: MediaQuery.of(context).size.width,
                      //       borderRadius: 10.wp,
                      //     ),
                      //   ),
                      // ],
                      ),
                ),
              )),
        ));
  }
}

class ContentPlaceHolder extends StatelessWidget {
  const ContentPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return Shimmer.fromColors(
      baseColor: customColors.warningColor,
      highlightColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(children: [
          ShimmerContainer(
              bottomMargin: 0,
              leftMargin: 15,
              height: 40.w,
              width: MediaQuery.of(context).size.width,
              borderRadius: 10.w,
              rightMargin: 15.w),
          SizedBox(height: 14.h),
          ShimmerContainer(
              bottomMargin: 0,
              leftMargin: 15,
              height: MediaQuery.of(context).size.height * 0.78,
              width: MediaQuery.of(context).size.width,
              borderRadius: 10,
              rightMargin: 15.w),
        ]),
      ),
    );
  }
}
