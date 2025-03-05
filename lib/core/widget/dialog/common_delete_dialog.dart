import 'package:expensetracker/core/theme/theme_extension.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/button/custom_rounded_button.dart';
import 'package:expensetracker/generated/l10n.dart';

Future commonDeleteDialog({
  required BuildContext context,
  required String title,
  String? subTitle,
}) {
  return showDialog(
      context: context,
      builder: (context) => DeleteDialogWidget(
            title: title,
            subTitle: subTitle,
          ));
}

class DeleteDialogWidget extends StatelessWidget {
  final String title;
  final String? subTitle;

  const DeleteDialogWidget({
    super.key,
    required this.title,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    final customColors = theme.extension<CustomThemeExtension>()!;
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.w))),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
            // color: Theme.of(context).primaryColor,
            color: customColors.errorColor,
            fontWeight: FontWeight.bold),
      ),
      content: Text(
        subTitle ?? "Are you sure you want to delete?",
        style: Theme.of(context).textTheme.bodySmall,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "cancel",
              style: theme.textTheme.bodyLarge!.copyWith(
                fontSize: 14,
              ),
            )),
        SizedBox(width: 10.w),
        SizedBox(
          width: 130,
          height: 34,
          child: CustomRoundedButton(
            icon: Icons.delete_outline,
            title: "confirm",
            onPressed: () {
              Navigator.pop(context, true);
              return true;
            },
            fontSize: 14,
            padding: EdgeInsets.zero,
            color: customColors.errorColor,
          ),
        )
      ],
    );
  }
}
