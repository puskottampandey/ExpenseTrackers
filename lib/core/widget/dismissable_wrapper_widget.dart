import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleWrapper extends StatelessWidget {
  final Widget child;
  final bool isDisable;
  final EdgeInsetsGeometry? margin;

  final String id;

  final Function() onDelete;
  final Function() onUpdate;
  final DismissDirection dismissDirection;

  const DismissibleWrapper({
    super.key,
    this.margin,
    required this.child,
    this.isDisable = false,
    required this.id,
    this.dismissDirection = DismissDirection.horizontal,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return isDisable
        ? child
        : Dismissible(
            direction: dismissDirection,
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                await onDelete();
                return false;
              } else if (direction == DismissDirection.startToEnd) {
                await onUpdate();
                return false;
              }
              return false;
            },
            onDismissed: (direction) {
              // if (direction == DismissDirection.endToStart) {
              //   onDelete();
              // } else if (direction == DismissDirection.startToEnd) {
              //   onUpdate();
              // }
            },
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.lightGray,
              ),
              margin: margin ??
                  EdgeInsets.symmetric(
                      horizontal: AppThemes.symmetricHozPadding.w,
                      vertical: 10.h),
              child: Icon(
                Icons.edit_square,
                color: Theme.of(context).primaryColor,
              ),
            ),
            secondaryBackground: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: CustomColors.red,
              ),
              margin: margin ??
                  EdgeInsets.symmetric(
                      horizontal: AppThemes.symmetricHozPadding.w,
                      vertical: 10.h),
              child: const Icon(
                Icons.delete,
                color: CustomColors.white,
              ),
            ),
            key: Key(id),
            child: child,
          );
  }
}
