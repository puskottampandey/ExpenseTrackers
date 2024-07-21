import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final email = AutoDisposeProvider((ref) => TextEditingController());
final password = AutoDisposeProvider((ref) => TextEditingController());

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  static final _formkeyLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailcontroller = ref.watch(email);
    final passwordcontroller = ref.watch(password);
    return ReuseableScaffold(
      appbar: true,
      text: "Login",
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              Form(
                key: _formkeyLogin,
                child: Column(
                  children: [
                    ReusableFormField(
                      controller: emailcontroller,
                      hint: "Email",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a email";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ReusableFormField(
                      obscureText: true,
                      controller: passwordcontroller,
                      hint: "Password",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a password";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ReuseableButton(
                      bgcolor: kPrimaryVoiletColor,
                      text: "Login",
                      textcolor: kvverylightColor,
                      ontap: () {
                        if (_formkeyLogin.currentState!.validate()) {}
                        context.push("/accountSetup");
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push("/forgotpassword");
                      },
                      child: Text(
                        "Forgot Password?",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: regular2,
                          color: kPrimaryVoiletColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push("/signup");
                      },
                      child: RichText(
                        text: TextSpan(
                            text: "Don't have an account yet? ",
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: regular2,
                              color: kPrimarylightColor,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: "SignUp",
                                style: textTheme.bodyLarge!.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontSize: regular2,
                                  color: kPrimaryVoiletColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]),
                      ),
                    ),
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
