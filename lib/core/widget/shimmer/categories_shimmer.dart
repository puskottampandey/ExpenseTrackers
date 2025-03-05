import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/wrapper/grid_view_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';


class CategoriesShimmer extends StatelessWidget {
  final int? length;
  const CategoriesShimmer({super.key, this.length});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // final theme=Theme.of(context);
    // final textTheme = theme.textTheme;
    return GridViewWrapper(
      itemCount: length ?? 8,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: UiUtils.isLightMode(theme)
              ? CustomColors.lightGray
              : CustomColors.darkGrey,
          highlightColor: theme.colorScheme.surface,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.primaryColor)),
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: UiUtils.isLightMode(theme)
                          ? CustomColors.lightGray
                          : CustomColors.darkGrey,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: UiUtils.isLightMode(theme)
                        ? CustomColors.lighterGrey
                        : CustomColors.darkerGrey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
