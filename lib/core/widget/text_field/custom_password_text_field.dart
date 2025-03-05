import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomPasswordTextField extends StatefulWidget {
  final double width, height;
  final String labelText;
  final Color? color;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isShowHelperText;
  final void Function(String)? onChanged;

  const CustomPasswordTextField(
      {super.key,
      this.width = double.infinity,
      this.height = 60,
      required this.labelText,
      this.initialValue,
      this.onChanged,
      this.textInputType,
      this.controller,
      this.validator,
      this.color,
      this.isShowHelperText = true});

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isPasswordShown = false;

  void onPressedHandler() {
    setState(() {
      _isPasswordShown = !_isPasswordShown;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final _isLightMode = UiUtils.isLightMode(theme);
    return SizedBox(
      width: widget.width,
      // height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_isPasswordShown ? true : false,
        cursorColor: widget.color,
        validator: widget.validator,
        style: textTheme.bodyMedium!
            .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          errorMaxLines: 3,
          errorStyle: textTheme.bodyMedium!.copyWith(
            inherit: true, fontSize: 13, color: theme.colorScheme.error,
            // fontWeight: FontWeight.w400
          ),
          helperStyle: textTheme.bodyMedium!.copyWith(
              inherit: true,
              fontSize: 13,
              // fontWeight: FontWeight.w400

              color: _isLightMode
                  ? CustomColors.darkGrey
                  : CustomColors.lightGray),
          helperMaxLines: 3,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
          helperText: widget.isShowHelperText
              ? "Please use 8 or more characters with letters, numbers & symbols"
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: _isLightMode
                      ? CustomColors.midGrayColor
                      : CustomColors.lighterGrey),
              borderRadius: BorderRadius.circular(6)),
          labelText: widget.labelText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  color:
                      _isLightMode ? CustomColors.grey : CustomColors.white)),
          labelStyle: textTheme.labelLarge!.copyWith(),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordShown
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: onPressedHandler),
        ),
      ),
    );
  }
}
