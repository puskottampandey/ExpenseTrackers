import 'package:flutter/material.dart';

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color successColor;
  final Color warningColor;
  final Color errorColor;
  final Color backGroundColor;

  CustomThemeExtension({
    required this.successColor,
    required this.warningColor,
    required this.errorColor,
    required this.backGroundColor,
  });

  @override
  CustomThemeExtension copyWith({
    Color? successColor,
    Color? warningColor,
    Color? errorColor,
    Color? backGroundColor,
  }) {
    return CustomThemeExtension(
      successColor: successColor ?? this.successColor,
      warningColor: warningColor ?? this.warningColor,
      errorColor: errorColor ?? this.errorColor,
      backGroundColor: backGroundColor ?? this.backGroundColor,
    );
  }

  @override
  CustomThemeExtension lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      successColor: Color.lerp(successColor, other.successColor, t)!,
      warningColor: Color.lerp(warningColor, other.warningColor, t)!,
      errorColor: Color.lerp(errorColor, other.errorColor, t)!,
      backGroundColor: Color.lerp(backGroundColor, other.backGroundColor, t)!,
    );
  }
}
