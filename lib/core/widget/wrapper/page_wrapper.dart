

import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';

class PageWrapper extends StatelessWidget {
  final String title;
  final Widget body;
  final Color? backGroundColor;
  final Widget? bottomSheet;

  final List<Widget>? action;

  const PageWrapper({
    super.key,
    required this.title,
    required this.body,
    this.backGroundColor,
    this.action,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final _isLightMode = UiUtils.isLightMode(theme);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (canPop, value) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: CustomAppBar(
          title: title,
          actions: action ?? [],
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomSheet,
      ),
    );
  }
}
