import 'package:flutter/material.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final void Function()? onPressed;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? iconColor;
  final double verticalPadding;
  final double horizontalPadding;
  final double iconSize;
  final bool shadow;
  final bool hasBorderOutline;
  final double outlineBorderWidth;

  final Color? gradientPrimaryColor;
  final Color? gradientSecondaryColor;
  final Color? outLineColor;
  final double containerInnerPadding;

  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.borderRadius = 8,
    this.backgroundColor,
    this.iconColor,
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.iconSize = 24,
    this.shadow = true,
    this.hasBorderOutline = false,
    this.outlineBorderWidth = 2,
    this.gradientPrimaryColor,
    this.gradientSecondaryColor,
    this.outLineColor,
    this.containerInnerPadding=10,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final customColors = Theme.of(context).extension<CustomThemeExtension>()!;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Material(
        elevation: 0,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(containerInnerPadding),
            decoration: BoxDecoration(
              gradient: gradientSecondaryColor != null
                  ? LinearGradient(
                      colors: [
                        gradientPrimaryColor ??
                            backgroundColor ??
                            theme.primaryColor,
                        gradientSecondaryColor!,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : null,
              borderRadius: BorderRadius.circular(borderRadius),
              border: hasBorderOutline
                  ? Border.all(
                      width: outlineBorderWidth,
                      color: outLineColor ?? iconColor ?? theme.primaryColor)
                  : null,
              color: backgroundColor,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
