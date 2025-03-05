import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    this.width = double.infinity,
    this.height,
    this.fontSize = 14,
    this.labelText,
    this.isObscureText = false,
    this.initialValue,
    this.textInputType,
    this.controller,
    this.validator,
    this.color,
    this.prefixIcon,
    this.maxLength,
    this.onTap,
    this.onChanged,
    this.suffixIcon,
    this.isReadOnly = false,
    this.isRequired = false,
    this.maxLines = 1,
    this.helperText,
    this.textInputFormatterList,
    this.bottomMargin,
    this.textInputAction,
    this.hintText,
    this.contentPadding,
    this.isDisable = false,
    TextStyle? helperStyle,
  });

  final double? width;
  final double? height;
  final double fontSize;
  final String? labelText;
  final bool isObscureText;
  final bool isReadOnly;
  final Color? color;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final Function()? onTap;
  final void Function(String)? onChanged;
  final bool isRequired;
  final int maxLines;
  final String? helperText;
  final List<TextInputFormatter>? textInputFormatterList;
  final double? bottomMargin;
  final TextInputAction? textInputAction;
  final String? hintText;

  final EdgeInsets? contentPadding;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    return AbsorbPointer(
      absorbing: isDisable,
      child: Container(
        margin: EdgeInsets.only(bottom: bottomMargin ?? 20),
        width: width,
        height: height,
        child: TextFormField(
          scrollPadding: const EdgeInsets.all(0),
          textAlign: maxLength != null ? TextAlign.center : TextAlign.left,
          controller: controller,
          keyboardType: textInputType,
          obscureText: isObscureText,
          cursorColor: color,

          //  maxLines: 1, // Set the maximum number of lines to 1
          // overflow: TextOverflow.ellipsis,
          initialValue: initialValue,
          validator: validator,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          readOnly: isReadOnly,
          maxLines: maxLines,
          textInputAction: textInputAction,
          inputFormatters: textInputFormatterList,
          style: maxLength == 1
              ? textTheme.bodyMedium!.copyWith(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )

              // TextStyle(
              //     color: color,
              //     fontSize: 14,
              //     fontWeight: FontWeight.w400,
              //   )
              :

              // TextStyle(
              //     color: theme.colorScheme.surface,
              //     fontSize: fontSize,
              //     fontWeight: FontWeight.w400,
              //   ),
              textTheme.bodyMedium!.copyWith(
                  color: theme.colorScheme.surface,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                ),
          decoration: InputDecoration(
              hintText: hintText,
              errorStyle: const TextStyle(inherit: true, fontSize: 13),
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
              counterText: "",
              helperText: helperText,
              helperStyle: TextStyle(
                inherit: true,
                color: theme.primaryColor,
              ),
              fillColor: theme.colorScheme.surface,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(
                      color: _isLightMode
                          ? CustomColors.midGrayColor
                          : CustomColors.lighterGrey)),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color:
                        _isLightMode ? CustomColors.grey : CustomColors.white),
                borderRadius: BorderRadius.circular(6.r),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: color ?? Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(6)),
              labelText: labelText != null
                  ? isRequired
                      ? "$labelText * "
                      : labelText
                  : null,
              alignLabelWithHint: true,
              labelStyle: textTheme.labelLarge),
        ),
      ),
    );
  }
}
