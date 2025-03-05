import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/widget/button/custom_fav_icon_button.dart';
import 'package:expensetracker/core/widget/button/custom_outline_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomActionButtonDeleteUpdate extends StatelessWidget {
  final VoidCallback? onDelete;
  final VoidCallback? onUpdate;
  final VoidCallback? onView;
  const CustomActionButtonDeleteUpdate(
      {super.key, this.onDelete, this.onUpdate, this.onView});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customColors = theme.extension<CustomThemeExtension>()!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (onUpdate != null)
          CustomFavIconButton(
            hasBorderOutline: false,
            icon: FontAwesomeIcons.solidPenToSquare,
            onPressed: onUpdate,
            iconColor: theme.primaryColor,
          ),
        if (onDelete != null)
          CustomFavIconButton(
            icon: FontAwesomeIcons.trashCan,
            hasBorderOutline: false,
            onPressed: onDelete,
            iconColor: customColors.errorColor,
          ),
        SizedBox(width: 10.w),
        if (onView != null)
          CustomOutlineButton(
            backGroundColor: CustomColors.white,
            title: "View Details",
            sufixIcon: Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: theme.primaryColor,
            ),
            onPressed: onView,
          )
      ],
    );
  }
}
