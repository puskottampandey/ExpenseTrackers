import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/button/custom_icon_button.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leadingIcon;
  final Widget? centerWidget;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final Color? tabBackgroundColor;
  final String? title;
  final bool showBottomBorder;
  final Function()? onBackPressed;
  final bool showBackButton;
  final bool centerMiddle;
  final double? leftPadding;
  final double? rightPadding;
  final double topPadding;
  final BorderRadiusGeometry? borderRadius;
  final TextStyle? titleStyle;
  final double? appElevation;

  final Brightness? statusBarIconBrightness;

  final Color? statusBarColor;
  const CustomAppBar({
    super.key,
    this.centerWidget,
    this.leadingIcon,
    this.bottom,
    this.backgroundColor,
    this.tabBackgroundColor,
    this.title,
    this.actions = const [],
    this.showBottomBorder = true,
    this.onBackPressed,
    this.centerMiddle = true,
    this.showBackButton = true,
    this.leftPadding,
    this.rightPadding,
    this.topPadding = 10,
    this.borderRadius,
    this.titleStyle,
    this.appElevation,
    this.statusBarColor,
    this.statusBarIconBrightness,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    bool canPop = Navigator.of(context).canPop();
    final _isLightMode = UiUtils.isLightMode(theme);

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor ??
              theme.appBarTheme.systemOverlayStyle?.statusBarColor ??
              theme.primaryColor,
          //  Theme.of(context).colorScheme.secondary,
          // statusBarColor: Theme.of(context).primaryColor,

          statusBarIconBrightness:
              theme.appBarTheme.systemOverlayStyle?.statusBarIconBrightness ??
                  Brightness.dark,
          statusBarBrightness:
              theme.appBarTheme.systemOverlayStyle?.statusBarBrightness ??
                  Brightness.light,
        ),
        child: Material(
          borderRadius: borderRadius,
          elevation: appElevation ?? 0,
          color: statusBarColor ?? theme.scaffoldBackgroundColor,
          shadowColor: Theme.of(context).primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(
                    left: leftPadding ?? AppThemes.symmetricHozPadding.w,
                    right: rightPadding ?? AppThemes.symmetricHozPadding.w,
                    top: MediaQuery.of(context).padding.top + topPadding,
                  ),
                  decoration: BoxDecoration(
                    // color: backgroundColor ?? theme.colorScheme.surface,
                    borderRadius: borderRadius,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 50.h),
                    child: NavigationToolbar(
                      leading: leadingIcon != null
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [leadingIcon!],
                            )
                          : ((showBackButton && canPop)
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomIconButton(
                                      // iconSize: 20.h,
                                      // verticalPadding: 12,
                                      // horizontalPadding: 12,
                                      // outlineBorderWidth: 1,
                                      icon: Icons.arrow_back_ios_new_rounded,
                                      iconColor: Theme.of(context).primaryColor,
                                      backgroundColor: CustomColors.lightGray,
                                      // hasBorderOutline: true,
                                      borderRadius: 100.r,
                                      onPressed: onBackPressed ??
                                          () {
                                            context.pop();
                                          },
                                      shadow: false,
                                    ),
                                  ],
                                )
                              : null),
                      middle: title != null
                          ? Text(
                              title!,
                              style: titleStyle ??
                                  textTheme.headlineMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                            )
                          : centerWidget,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...actions,
                          ...[
                            if (kDebugMode)
                              Switch(
                                inactiveThumbColor: theme.primaryColor,
                                // inactiveTrackColor: theme.primaryColor,

                                value: false,
                                onChanged: (value) {
                                  context.read<ThemeCubit>().toggleTheme();
                                },
                              ),
                          ]
                        ],
                      ),
                      centerMiddle: centerMiddle,
                      middleSpacing: NavigationToolbar.kMiddleSpacing,
                    ),
                  ),
                ),
              ),
              // if (bottom == null)
              //   Container(
              //     height: 1,
              //     color: Theme.of(context).primaryColor,
              //   ),
              if (bottom != null)
                Container(
                  color: tabBackgroundColor,
                  child: bottom!,
                )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(160);
}
