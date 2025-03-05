import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeField extends StatelessWidget {
  final TextEditingController? controller;
  final int length;
  final void Function(String) onChanged;
  final bool isObscureText;
  final double? fieldHeight;
  final double? fieldWidth;
  final String? Function(String?)? validator;
  final MainAxisAlignment mainAxisAlignment;
  const CustomPinCodeField({
    super.key,
    this.controller,
    this.length = 4,
    required this.onChanged,
    this.isObscureText = true,
    this.fieldHeight,
    this.fieldWidth,
    this.validator,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final mediaQuery = MediaQuery.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: PinCodeTextField(
        obscureText: isObscureText,
        appContext: context,
        length: length,
        blinkWhenObscuring: true,
        blinkDuration: const Duration(milliseconds: 450),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        keyboardType: TextInputType.number,
        errorTextMargin: EdgeInsets.only(
          bottom: 5.h,
          top: 5.h,
        ),
        controller: controller,
        textStyle: theme.textTheme.headlineMedium!
            .copyWith(color: theme.colorScheme.surface),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: fieldHeight ?? 50.h,
          fieldWidth: fieldWidth ?? 50.w,
          borderWidth: 0,
          fieldOuterPadding: mainAxisAlignment == MainAxisAlignment.start
              ? EdgeInsets.only(right: 10.w)
              : EdgeInsets.zero,
          activeColor: Theme.of(context).primaryColor.withOpacity(0.9),
          activeFillColor: Theme.of(context).primaryColor.withOpacity(0.3),
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.9),
          selectedFillColor: Theme.of(context).primaryColor.withOpacity(0.05),
          inactiveFillColor: Theme.of(context).primaryColor.withOpacity(0.3),
          inactiveColor: Theme.of(context).primaryColor.withOpacity(0.9),
          inactiveBorderWidth: 1,
          activeBorderWidth: 1,
          selectedBorderWidth: 1,
        ),
        mainAxisAlignment: mainAxisAlignment,
        animationType: AnimationType.fade,
        enableActiveFill: true,
        autovalidateMode: AutovalidateMode.disabled,
        cursorColor: theme.primaryColor,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
