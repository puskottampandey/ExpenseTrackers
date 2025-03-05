import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeaderTile extends StatelessWidget {
  final String title;
  final Widget? child;

  const HeaderTile({super.key, required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;

    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: textTheme.bodyMedium!.copyWith(
                color: _isLightMode ? CustomColors.darkGrey : CustomColors.grey,
                fontWeight: FontWeight.bold,
              )),
        ),
        if (child != null) child!,
      ],
    );
  }
}
