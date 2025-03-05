
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatusCard extends StatelessWidget {
  final Color? color;
  final Color? backGroundColor;
  final double borderRadius;

  final VoidCallback? onTap;

  final String status;
  final IconData? icon;
  final double iconSize;

  const StatusCard({
    super.key,
    this.color = CustomColors.black,
    this.backGroundColor = CustomColors.lightGray,
    this.borderRadius = 10,
    required this.status,
    this.icon,
    this.onTap,
    this.iconSize = 15,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // final _isLightMode = UiUtils.isLightMode(theme);
    // final customColors = theme.extension<CustomThemeExtension>()!;
    return InkWell(
      // onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: backGroundColor ?? CustomColors.lightGray,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                status.replaceAll("_", " ").capitalize(),
                style: textTheme.bodySmall!.copyWith(
                  color: color ?? theme.colorScheme.onSurface,
                ),
              ),
              if (icon != null)
                SizedBox(
                  width: 5.w,
                ),
              if (icon != null)
                Icon(
                  icon,
                  size: iconSize,
                  color: color ?? theme.colorScheme.onSurface,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
