import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:expensetracker/core/widget/button/custom_svg_icon_button.dart';
import 'package:go_router/go_router.dart';
import 'package:expensetracker/core/theme/theme_import.dart';


class CommonDialogWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsets? insetPadding;
  const CommonDialogWrapper({
    super.key,
    required this.child,
    this.insetPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      insetPadding: insetPadding ??
          EdgeInsets.symmetric(
              horizontal: AppThemes.symmetricHozPadding.w, vertical: 20.h),
      child: Stack(
        children: [
          child,
          Positioned(
              top: 5,
              right: 5,
              child: CustomSvgButton(
                svgName:"",
                onPressed: () {
                  context.pop();
                },
              ))
        ],
      ),
    );
  }
}
