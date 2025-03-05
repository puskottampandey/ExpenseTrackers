import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.width = double.infinity,
    this.height,
    this.fontSize = 16,
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
    this.focusNode,
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
  final FocusNode? focusNode;

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
          selectionControls: MaterialTextSelectionControls(),
          focusNode: focusNode,
          scrollPadding: const EdgeInsets.all(0),
          textAlign: maxLength != null ? TextAlign.center : TextAlign.left,
          controller: controller,
          keyboardType: textInputType,
          obscureText: isObscureText,
          cursorColor: color,
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
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                )
              : textTheme.bodyMedium!
                  .copyWith(fontSize: fontSize, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
              hintText: hintText,
              errorStyle: textTheme.bodyMedium!.copyWith(
                inherit: true, fontSize: 13, color: theme.colorScheme.error,
                // fontWeight: FontWeight.w400
              ),
              contentPadding: contentPadding ??
                  EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
              counterText: "",
              helperText: helperText,
              helperStyle: TextStyle(
                inherit: true,
                fontSize: 13,
                color: Theme.of(context).primaryColor,
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
                        : CustomColors.lighterGrey),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    color: color ?? _isLightMode
                        ? CustomColors.grey
                        : CustomColors.white),
                borderRadius: BorderRadius.circular(6),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: _isLightMode
                          ? CustomColors.midGrayColor
                          : CustomColors.lighterGrey),
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
