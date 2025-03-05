
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';

class CommonCardWrapper extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? color;
  final double? borderRadius;
  final Widget child;
  final Function()? onTap;

  const CommonCardWrapper({
    super.key,
    this.margin,
    this.padding,
    this.color,
    required this.child,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = Theme.of(context).extension<CustomThemeExtension>()!;

    return Container(
      decoration: BoxDecoration(
          color: color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular((borderRadius ?? 10).r),
          border: Border.all(width: 1.5, color: CustomColors.lightGray),
          boxShadow: <BoxShadow>[
            // const BoxShadow(
            //     offset: Offset(0, 2),
            //     blurRadius: 2,
            //     spreadRadius: 2,
            //     color: CustomColors.lightGray),
          ]),
      margin: margin ?? EdgeInsets.only(bottom: 12.h),
      padding: padding ?? EdgeInsets.all(10.h),
      child: InkWell(onTap: onTap, child: child),
    );
  }
}
