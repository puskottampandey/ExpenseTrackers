import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:expensetracker/core/widget/svg/common_svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomSearchField extends StatelessWidget {
  final Function()? onTapSuffixButton;
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onFieldSubmitted;

  final void Function(String)? onChanged;
  const CustomSearchField(
      {super.key,
      required this.controller,
      this.onTapSuffixButton,
      required this.hintText,
      this.onFieldSubmitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    // final txt = theme.textTheme;

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    return TextFormField(
      scrollPadding: const EdgeInsets.all(0),
      style: textTheme.bodyLarge,
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.search,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffix: InkWell(
            onTap: onTapSuffixButton,
            child: Text(
              "Clear",
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.primaryColor),
            )),
        hintText: hintText,
        prefixIcon: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CommonSvgWidget(
                svgName:" Assets.search",
                height: 5.h,
                width: 5.w,
                color: _isLightMode ? CustomColors.grey : CustomColors.white)),
        hintStyle:
            theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
        contentPadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: _isLightMode
                  ? CustomColors.midGrayColor
                  : CustomColors.lighterGrey,
              width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: _isLightMode
                  ? CustomColors.midGrayColor
                  : CustomColors.lighterGrey,
              width: 1),
          borderRadius: BorderRadius.circular(6.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.primaryColor),
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}
