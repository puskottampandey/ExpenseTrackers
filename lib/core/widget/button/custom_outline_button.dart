import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineButton extends StatelessWidget {
  final Function()? onPressed;
  final double verticalPadding;
  final double horizontalPadding;
  final String title;
  final Color? textColor;
  final Color? outLineColor;
  final Color? backGroundColor;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final double fontSize;
  final double height;

  const CustomOutlineButton({
    super.key,
    this.onPressed,
    this.verticalPadding = 8,
    this.horizontalPadding = 15,
    required this.title,
    this.textColor,
    this.outLineColor,
    this.backGroundColor,
    this.prefixIcon,
    this.sufixIcon,
    this.fontSize = 14,
    this.height = 42,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Material(
      elevation: 0.5,
      borderRadius: BorderRadius.circular(8),
      color: Theme.of(context).primaryColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onPressed,
        child: Container(
            height: height,
            padding: EdgeInsets.symmetric(
              vertical: 2,
              horizontal: horizontalPadding.h,
            ),
            decoration: BoxDecoration(
                color: backGroundColor ?? theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                    width: 1.w,
                    color: outLineColor ?? theme.colorScheme.onSurface)),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (prefixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: prefixIcon!,
                    ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall!.copyWith(
                      color: textColor ?? theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      fontSize: fontSize,
                    ),
                  ),
                  if (sufixIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: sufixIcon!,
                    ),
                ],
              ),
            )),
      ),
    );
  }
}
