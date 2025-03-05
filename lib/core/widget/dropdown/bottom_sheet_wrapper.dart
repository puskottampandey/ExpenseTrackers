import 'package:expensetracker/core/theme/app_theme.dart';

import 'package:expensetracker/core/theme/theme_import.dart';

class BottomSheetWrapper extends StatelessWidget {
  final EdgeInsets? padding;
  final double? topPadding;
  final Widget child;
  final Widget? header;

  final double? height;

  const BottomSheetWrapper({
    super.key,
    this.padding,
    this.topPadding,
    required this.child,
    this.header,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      height: height,
      padding: padding ??
          EdgeInsets.only(
            left: AppThemes.symmetricHozPadding.w,
            right: AppThemes.symmetricHozPadding.w,
            top: 24.h,
            bottom: 24.h,
          ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: _theme.scaffoldBackgroundColor,
      ),
      child: Column(
        children: [
          header ?? const SizedBox(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
