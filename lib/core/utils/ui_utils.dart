import 'package:flutter/material.dart';

class UiUtils {
  static isLightMode(ThemeData theme) {
    if (theme.brightness == Brightness.light) {
      return true;
    }
    return false;
  }
}
