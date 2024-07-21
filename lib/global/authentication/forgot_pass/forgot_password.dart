import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final forgotpass = AutoDisposeProvider((ref) => TextEditingController());

class ForgotPasswordScreen extends ConsumerWidget {
  const ForgotPasswordScreen({super.key});
  static final _formkeyforgot = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotController = ref.watch(forgotpass);
    return ReuseableScaffold(
      appbar: true,
      text: "Forgot Password",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                "Don’t worry.",
                textAlign: TextAlign.start,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: title2,
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Enter your email and we’ll send you a link to reset your password.",
                maxLines: 3,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: title2,
                  color: kPrimaryDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                key: _formkeyforgot,
                child: Column(
                  children: [
                    ReusableFormField(
                      controller: forgotController,
                      hint: "Email",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a Email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReuseableButton(
                      text: "Continue",
                      bgcolor: kPrimaryVoiletColor,
                      textcolor: kvverylightColor,
                      ontap: () {
                        context.go("/confirmScreen");
                        if (_formkeyforgot.currentState!.validate()) {}
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
