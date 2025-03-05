import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundedButton extends StatefulWidget {
  const CustomRoundedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.color,
    this.horizontalPadding = 15,
    this.verticalPadding = 8,
    this.fontSize = 14,
    this.textColor,
    this.fontWeight = FontWeight.w600,
    this.horizontalMargin = 0,
    this.icon,
    this.iconsize = 22,
    this.borderRadius = 8,
    this.elevation = 5,
    this.prefixIcon,
    this.outlineColor,
    this.iconColor,
    this.height = 42,
  });
  final String title;
  final Function()? onPressed;
  final bool isDisabled;
  final bool isLoading;
  final Color? color;
  final EdgeInsets? padding;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final double horizontalMargin;
  final IconData? icon;
  final double borderRadius;
  final double iconsize;
  final double elevation;
  final Widget? prefixIcon;
  final Color? outlineColor;
  final Color? iconColor;
  final double height;

  @override
  CustomRoundedButtonState createState() => CustomRoundedButtonState();
}

class CustomRoundedButtonState extends State<CustomRoundedButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: widget.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
        child: Material(
          elevation: widget.elevation,
          color: widget.isDisabled
              ? theme.colorScheme.surface
              : (widget.color ?? theme.colorScheme.secondary),
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: InkWell(
            onTap: widget.isDisabled
                ? null
                : widget.isLoading
                    ? null
                    : widget.onPressed,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Container(
              padding: widget.padding ??
                  EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: widget.horizontalPadding.w,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: widget.isDisabled
                    ? null
                    : Border.all(
                        color: widget.outlineColor ??
                            widget.color ??
                            theme.primaryColor,
                      ),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.prefixIcon != null)
                      Row(
                        children: [
                          widget.prefixIcon!,
                          SizedBox(
                            width: 2.h,
                          )
                        ],
                      ),
                    Text(
                      widget.title,
                      style: theme.textTheme.headlineSmall!.copyWith(
                        fontWeight: widget.fontWeight,
                        color: widget.isDisabled
                            ? theme.colorScheme.onSurface
                            : widget.textColor ?? theme.colorScheme.surface,
                        fontSize: widget.fontSize,
                      ),
                    ),
                    if (widget.icon != null)
                      Padding(
                        padding: EdgeInsets.only(left: 8.w, right: 4.w),
                        child: Icon(
                          widget.icon,
                          color: widget.iconColor ?? theme.colorScheme.surface,
                          size: widget.iconsize,
                        ),
                      ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeOut,
                      child: widget.isLoading
                          ? Container(
                              height: 14,
                              width: 14,
                              margin: const EdgeInsets.only(left: 8),
                              child: CircularProgressIndicator(
                                color: theme.colorScheme.surface,
                                strokeWidth: 2,
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
