import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationLoader extends StatelessWidget {
  const LocationLoader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(10.r)),
      // alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Fetching Lat, Long ...",
            // style: TextStyle(
            //   fontSize: 12,
            //   color: theme.primaryColor,
            // ),
          ),
          const SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            strokeWidth: 1,
            backgroundColor: UiUtils.isLightMode(theme)
                ? CustomColors.lightGray
                : CustomColors.darkGrey,
          ),
        ],
      ),
    );
  }
}
