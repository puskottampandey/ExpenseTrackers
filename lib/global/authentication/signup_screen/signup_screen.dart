import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/constants/image_path.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

final nametext = AutoDisposeProvider((ref) => TextEditingController());
final emailtext = AutoDisposeProvider((ref) => TextEditingController());
final passwordtext = AutoDisposeProvider((ref) => TextEditingController());
final ischecked = StateProvider((ref) => false);

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  static final _formkeySignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nametext);
    final emailController = ref.watch(emailtext);
    final passwordController = ref.watch(passwordtext);
    final isCheckedbox = ref.watch(ischecked);
    return ReuseableScaffold(
      appbar: true,
      text: "Sign Up",
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
                  key: _formkeySignup,
                  child: Column(
                    children: [
                      ReusableFormField(
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        hint: "Name",
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a first name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ReusableFormField(
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        hint: "Email",
                        keyboardType: TextInputType.emailAddress,
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
                        controller: passwordController,
                        textInputAction: TextInputAction.go,
                        hint: "Password",
                        validation: true,
                        obscureText: true,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a password";
                          } else if (!ImportantKey.passwordCheck
                              .hasMatch(value)) {
                            return "Enter a password";
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r)),
                              activeColor: kPrimaryVoiletColor,
                              value: isCheckedbox,
                              onChanged: (bool? value) {
                                ref.read(ischecked.notifier).state = value!;
                              },
                            ),
                          ),
                          Expanded(
                            child: RichText(
                                maxLines: 2,
                                text: TextSpan(
                                    text: "By signing up, you agree to the",
                                    style: textTheme.bodyLarge!.copyWith(
                                      fontSize: regular2,
                                      color: kseconadaryDarkColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            " Terms of Service and Privacy Policy",
                                        style: textTheme.bodyLarge!.copyWith(
                                          fontSize: regular2,
                                          color: kPrimaryVoiletColor,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ])),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ReuseableButton(
                        minimumSize: Size(double.infinity, 40.h),
                        text: "Sign Up",
                        bgcolor: kPrimaryVoiletColor,
                        textcolor: kwhitelightColor,
                        ontap: () {
                          if (_formkeySignup.currentState!.validate()) {}
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Or with",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: regular3,
                          color: kPrimarylightColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ReuseableButton(
                        widgetextra: true,
                        bgcolor: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagePath.googleLogo,
                              height: 18.h,
                            ),
                            Text(
                              '  Sign Up with Google',
                              style: textTheme.bodyLarge!.copyWith(
                                fontSize: regular2,
                                color: kPrimaryDarkColor,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.push('/login');
                        },
                        child: RichText(
                          text: TextSpan(
                              text: "Already have an account? ",
                              style: textTheme.bodyLarge!.copyWith(
                                fontSize: regular2,
                                color: kPrimarylightColor,
                                fontWeight: FontWeight.w600,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: textTheme.bodyLarge!.copyWith(
                                    decoration: TextDecoration.underline,
                                    fontSize: regular2,
                                    color: kPrimaryVoiletColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
