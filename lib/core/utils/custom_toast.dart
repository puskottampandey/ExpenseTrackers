import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static success(
      {required String message, Toast? length, ToastGravity? gravity}) {
    cancelToast();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      toastLength: length ?? Toast.LENGTH_LONG,
    );
  }

  static error(
      {required String message, Toast? length, ToastGravity? gravity}) {
    cancelToast();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: Theme.of(NavigationService.context).colorScheme.error,
      toastLength: length ?? Toast.LENGTH_LONG,
    );
  }

  static message(
      {required String message, Toast? length, ToastGravity? gravity}) {
    cancelToast();
    Fluttertoast.showToast(
      msg: message,
      gravity: gravity ?? ToastGravity.BOTTOM,
      backgroundColor: Theme.of(NavigationService.context).colorScheme.surface,
      textColor: AppThemes.black,
      toastLength: length ?? Toast.LENGTH_LONG,
    );
  }

  static cancelToast() {
    Fluttertoast.cancel();
  }
}
