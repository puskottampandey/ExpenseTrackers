import 'package:expensetracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function(String?)? onFieldSubmit;

  final TextEditingController? controller;
  final String? hint;
  final String? initialValue;
  final String? label;
  final String? labeltext;
  final bool obscureText;
  final bool isChirfaar;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final String? desc;

  final bool? enabled;
  final IconData? prefix;
  final Widget? sufixIcon;
  final TextCapitalization? textCapitalization;
  final bool requiredText;
  final bool marginBottom;
  final VoidCallback? onTap;
  final bool showError;
  final bool isPhone;
  final bool isFilled;
  final bool readonly;
  final bool? autofocus;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatter;
  final EdgeInsetsGeometry? contentPadding;
  final bool validation;
  const ReusableFormField({
    super.key,
    this.validator,
    this.onChanged,
    this.onFieldSubmit,
    this.enabled = true,
    this.marginBottom = true,
    this.isPhone = false,
    this.validation = false,
    this.hint,
    this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.isChirfaar = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.controller,
    this.prefix,
    this.desc,
    this.textCapitalization,
    this.requiredText = false,
    this.initialValue,
    this.onTap,
    this.sufixIcon,
    this.autofocus,
    this.textInputAction,
    this.showError = true,
    this.isFilled = true,
    this.readonly = false,
    this.inputFormatter,
    this.contentPadding,
    this.focusNode,
    this.labeltext,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ReusableFormFieldState createState() =>
      // ignore: no_logic_in_create_state
      _ReusableFormFieldState(obscureText: obscureText);
}

class _ReusableFormFieldState extends State<ReusableFormField> {
  String? errorText;
  bool interacted = false;

  bool obscureText;

  _ReusableFormFieldState({required this.obscureText});
  String _password = '';
  int _strength = 0; // Strength out of 100

  void _updatePassword(String value) {
    setState(() {
      _password = value;
      _calculateStrength();
    });
  }

  void _calculateStrength() {
    int length = _password.length;
    int strength = 0;
    if (length >= 8) strength += 20;
    if (RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).+$').hasMatch(_password)) {
      strength += 40;
    }
    if (RegExp(r'[0-9]').hasMatch(_password)) strength += 20;
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(_password)) strength += 20;

    setState(() {
      _strength = strength;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          widget.marginBottom ? EdgeInsets.only(bottom: 10.h) : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Material(
            shadowColor: kwhitelightColor,
            borderRadius: BorderRadius.circular(8.h),
            child: formField(context),
          ),
          errorTextWidget()
        ],
      ),
    );
  }

  TextFormField formField(BuildContext context) {
    return TextFormField(
      minLines: widget.minLines,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus ?? false,
      enabled: widget.enabled,
      readOnly: widget.readonly,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText,
      initialValue: widget.initialValue,
      maxLength: widget.maxLength ?? (widget.maxLines > 1 ? 1000 : 100),
      maxLines: widget.maxLines,
      textAlignVertical: TextAlignVertical.center,
      inputFormatters: widget.inputFormatter,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        counterText: "",
        filled: widget.isFilled,
        fillColor: Colors.white54,
        hintText: widget.hint,
        hintStyle:
            textTheme.titleSmall?.copyWith(color: Colors.grey, fontSize: 14.sp),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: const BorderSide(color: kPrimarylightColor)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.h),
          borderSide: const BorderSide(color: kPrimarylightColor),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.h),
            borderSide: const BorderSide(color: kPrimarylightColor)),
        prefixIcon: widget.prefix != null
            ? Icon(
                widget.prefix,
                color: const Color(0xffBDBDBD),
                size: 24.sp,
              )
            : null,
        isDense: true, // Added this
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        suffixIcon: widget.sufixIcon ??
            (widget.maxLines == 1
                ? widget.obscureText
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: kPrimaryDarkColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                        ),
                      )
                    : interacted && errorText == null
                        ? Icon(Icons.check,
                            color: Theme.of(context).primaryColor)
                        : null
                : null),
      ),
      validator: (value) {
        if (widget.validator != null) {
          setState(() {
            errorText = widget.validator!(value);
          });
        }
        return errorText == null ? null : '';
      },
      autovalidateMode: AutovalidateMode.disabled,
      onChanged: widget.onChanged != null
          ? widget.onChanged?.call
          : (value) {
              if (widget.validator != null) {
                setState(() {
                  _updatePassword(widget.controller!.text);
                  errorText = widget.validator!(value);
                });
              }
            },
      onSaved: (value) {
        if (widget.validator != null) {
          setState(() {
            errorText = widget.validator!(value);
          });
        }
      },
      onFieldSubmitted: (value) {
        if (widget.onFieldSubmit != null) {
          widget.onFieldSubmit!.call(value);
        } else if (widget.validator != null) {
          setState(() {
            errorText = widget.validator!(value);
          });
        }
      },
    );
  }

  Widget errorTextWidget() {
    final lowerUpper =
        widget.controller?.text.contains(RegExp(r'^(?=.*[a-z])(?=.*[A-Z]).+$'));
    final number = widget.controller?.text.contains(RegExp(r'[0-9]'));
    final unique =
        widget.controller?.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final totalChar = widget.controller!.text.length >= 8;

    return widget.validation
        ? Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.r),
                value: _strength / 100,
                backgroundColor: kPrimarylightColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getColorForStrength(_strength),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              PassWordValidation(
                  passCheck: lowerUpper,
                  requirementText:
                      "One Uppercase [A-Z] and One lowercase [a-z]"),
              PassWordValidation(
                  passCheck: number,
                  requirementText: "One numeric value [0-9]]"),
              PassWordValidation(
                  passCheck: unique,
                  requirementText: "One special character [#, \$, % etc..]"),
              PassWordValidation(
                  passCheck: totalChar, requirementText: "8 characters minimum")
            ],
          )
        // : Container()
        : widget.showError
            ? errorText != null
                ? Row(
                    children: [
                      const Icon(Icons.error_outline_rounded,
                          size: 14, color: kPrimaryRedColor),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          errorText ?? "",
                          maxLines: 2,
                          style: textTheme.titleMedium!.copyWith(
                              color: kPrimaryRedColor, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  )
                : Container()
            : Container();
  }

  Color _getColorForStrength(int strength) {
    if (strength < 50) {
      return Colors.red;
    } else if (strength < 80) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }
}

class PassWordValidation extends StatelessWidget {
  final bool? passCheck;
  final String? requirementText;
  final IconData? activeIcon;
  final IconData? inActiveIcon;
  final Color? inActiveColor;
  final Color? activeColor;
  const PassWordValidation({
    Key? key,
    @required this.passCheck,
    @required this.requirementText,
    this.inActiveIcon = Icons.circle,
    this.activeIcon = Icons.circle,
    this.inActiveColor = Colors.grey,
    this.activeColor = Colors.green,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.5),
      child: Row(
        children: [
          passCheck!
              ? Icon(Icons.circle, size: 10, color: activeColor)
              : Icon(Icons.circle, size: 10, color: inActiveColor),
          SizedBox(width: 8.w),
          Text(requirementText!,
              style: textTheme.titleSmall?.copyWith(
                  color: passCheck! ? activeColor : inActiveColor,
                  fontSize: 10.sp))
        ],
      ),
    );
  }
}


// if (widget.label.isNotEmpty)
          //   Column(
          //     children: [
          //       Row(
          //         children: [
          //           Expanded(
          //             child: Container(
          //               padding: EdgeInsets.only(left: 6.w),
          //               alignment: Alignment.centerLeft,
          //               child: Text(
          //                 widget.label,
          //                 style: textPoppins.titleMedium!
          //                     .copyWith(fontSize: 14.sp),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),

// import 'package:expensetracker/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class ReusableFormField extends StatefulWidget {
//   final String? Function(String?)? validator;
//   final void Function(String?)? onChanged;
//   final void Function(String?)? onFieldSubmit;

//   final TextEditingController? controller;
//   final String? hint;
//   final String? initialValue;
//   final String? label;
//   final bool obscureText;
//   final bool isChirfaar;
//   final TextInputType keyboardType;
//   final int maxLines;
//   final int minLines;
//   final int? maxLength;
//   final String? desc;
//   final bool? enabled;
//   final IconData? prefix;
//   final Widget? sufixIcon;
//   final TextCapitalization? textCapitalization;
//   final bool requiredText;
//   final bool marginBottom;
//   final VoidCallback? onTap;
//   final bool showError;
//   final String? labeltext;
//   final bool isPhone;
//   final bool isFilled;
//   final bool readonly;
//   final bool? autofocus;
//   final TextInputAction? textInputAction;
//   final FocusNode? focusNode;
//   final List<TextInputFormatter>? inputFormatter;
//   final EdgeInsetsGeometry? contentPadding;
//   const ReusableFormField({
//     Key? key,
//     this.validator,
//     this.onChanged,
//     this.onFieldSubmit,
//     this.enabled = true,
//     this.marginBottom = true,
//     this.isPhone = false,
//     this.hint,
//     this.label,
//     this.keyboardType = TextInputType.text,
//     this.obscureText = false,
//     this.isChirfaar = false,
//     this.maxLines = 1,
//     this.minLines = 1,
//     this.maxLength,
//     this.controller,
//     this.prefix,
//     this.desc,
//     this.textCapitalization,
//     this.requiredText = false,
//     this.initialValue,
//     this.onTap,
//     this.sufixIcon,
//     this.autofocus,
//     this.textInputAction,
//     this.showError = true,
//     this.isFilled = true,
//     this.readonly = false,
//     this.inputFormatter,
//     this.contentPadding,
//     this.focusNode,
//     this.labeltext,
//   }) : super(key: key);

//   @override
//   _ReusableFormFieldState createState() =>
//       // ignore: no_logic_in_create_state
//       _ReusableFormFieldState(obscureText: obscureText);
// }

// class _ReusableFormFieldState extends State<ReusableFormField> {
//   String? errorText;
//   bool interacted = false;

//   bool obscureText;

//   _ReusableFormFieldState({required this.obscureText});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin:
//           widget.marginBottom ? EdgeInsets.only(bottom: 10.h) : EdgeInsets.zero,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           // if (widget.label.isNotEmpty)
//           //   Column(
//           //     children: [
//           //       Row(
//           //         children: [
//           //           Expanded(
//           //             child: Container(
//           //               padding: EdgeInsets.only(left: 6.w),
//           //               alignment: Alignment.centerLeft,
//           //               child: Text(
//           //                 widget.label,
//           //                 style: textPoppins.titleMedium!
//           //                     .copyWith(fontSize: 14.sp),
//           //               ),
//           //             ),
//           //           ),
//           //         ],
//           //       ),
//           //     ],
//           //   ),
//           Material(
//             shadowColor: kwhitelightColor,
//             borderRadius: BorderRadius.circular(8.h),
//             child: formField(context),
//           ),
//           errorTextWidget()
//         ],
//       ),
//     );
//   }

//   TextFormField formField(BuildContext context) {
//     return TextFormField(
//       minLines: widget.minLines,
//       focusNode: widget.focusNode,
//       autofocus: widget.autofocus ?? false,
//       enabled: widget.enabled,
//       readOnly: widget.readonly,
//       controller: widget.controller,
//       keyboardType: widget.keyboardType,
//       textInputAction: widget.textInputAction,
//       textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
//       obscureText: obscureText,
//       initialValue: widget.initialValue,
//       maxLength: widget.maxLength ?? (widget.maxLines > 1 ? 1000 : 100),
//       maxLines: widget.maxLines,
//       textAlignVertical: TextAlignVertical.center,
//       inputFormatters: widget.inputFormatter,
//       decoration: InputDecoration(
//         labelText: widget.labeltext,
//         counterText: "",
//         filled: widget.isFilled,
//         fillColor: Colors.white54,
//         hintText: widget.hint,
//         hintStyle:
//             textTheme.titleSmall?.copyWith(color: Colors.grey, fontSize: 14.sp),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.h),
//             borderSide: const BorderSide(color: kvverylightColor)),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8.h),
//           borderSide: const BorderSide(color: klightDarkColor),
//         ),
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.h),
//             borderSide: const BorderSide(color: klightDarkColor)),
//         prefixIcon: widget.prefix != null
//             ? Icon(
//                 widget.prefix,
//                 color: const Color(0xffBDBDBD),
//                 size: 24.sp,
//               )
//             : null,
//         isDense: true, // Added this
//         contentPadding: widget.contentPadding ??
//             EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
//         suffixIcon: widget.sufixIcon ??
//             (widget.maxLines == 1
//                 ? widget.obscureText
//                     ? Padding(
//                         padding: EdgeInsets.only(right: 8.w),
//                         child: IconButton(
//                           icon: Icon(
//                             obscureText
//                                 ? Icons.visibility_off_outlined
//                                 : Icons.visibility_outlined,
//                             color: kPrimaryDarkColor,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               obscureText = !obscureText;
//                             });
//                           },
//                         ),
//                       )
//                     : interacted && errorText == null
//                         ? Icon(Icons.check,
//                             color: Theme.of(context).primaryColor)
//                         : null
//                 : null),
//       ),
//       validator: (value) {
//         if (widget.validator != null) {
//           setState(() {
//             errorText = widget.validator!(value);
//           });
//         }
//         return errorText == null ? null : '';
//       },
//       autovalidateMode: AutovalidateMode.disabled,
//       onChanged: widget.onChanged != null
//           ? widget.onChanged?.call
//           : (value) {
//               if (widget.validator != null) {
//                 setState(() {
//                   errorText = widget.validator!(value);
//                 });
//               }
//             },
//       onSaved: (value) {
//         if (widget.validator != null) {
//           setState(() {
//             errorText = widget.validator!(value);
//           });
//         }
//       },
//       onFieldSubmitted: (value) {
//         if (widget.onFieldSubmit != null) {
//           widget.onFieldSubmit!.call(value);
//         } else if (widget.validator != null) {
//           setState(() {
//             errorText = widget.validator!(value);
//           });
//         }
//       },
//     );
//   }

//   Widget errorTextWidget() {
//     return widget.showError
//         ? errorText != null
//             ? Row(
//                 children: [
//                   const Icon(Icons.error_outline_rounded,
//                       size: 14, color: kPrimaryRedColor),
//                   const SizedBox(
//                     width: 5,
//                   ),
//                   Text(
//                     errorText ?? "",
//                     textAlign: TextAlign.end,
//                     style: textTheme.titleMedium!
//                         .copyWith(color: kPrimaryRedColor, fontSize: 12.sp),
//                   ),
//                 ],
//               )
//             : Container()
//         : Container();
//   }
// }
