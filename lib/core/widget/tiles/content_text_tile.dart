import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
class ContentTextTile extends StatelessWidget {
  final String title;

  final String? subTitle;
  final Widget? child;
  final int maxLine;
  const ContentTextTile({
    super.key,
    required this.title,
    this.child,
    this.subTitle,
    this.maxLine = 2,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "$title: ",
              style: textTheme.bodySmall!.copyWith(
                  color: _isLightMode
                      ? CustomColors.darkGrey
                      : CustomColors.lightGray),
            ),
          ),
          if (subTitle != null)
            Expanded(
              child: Text(
                subTitle!.isEmpty ? "__" : subTitle!,
                textAlign: TextAlign.end,
                maxLines: maxLine,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: _isLightMode
                        ? CustomColors.darkerGrey
                        : CustomColors.white),
              ),
            ),
          if (child != null)
            Align(
              alignment: Alignment.centerRight,
              child: child!,
            )
        ],
      ),
    );
  }
}
