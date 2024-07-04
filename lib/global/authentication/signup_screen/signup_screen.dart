import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final nametext = AutoDisposeProvider((ref) => TextEditingController());
final emailtext = AutoDisposeProvider((ref) => TextEditingController());
final passwordtext = AutoDisposeProvider((ref) => TextEditingController());

class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(nametext);
    final emailController = ref.watch(emailtext);
    final passwordController = ref.watch(passwordtext);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: textTheme.bodyLarge!.copyWith(
            fontSize: title3,
            color: kseconadaryDarkColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                ReusableFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  labeltext: "Name",
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a first name";
                    }
                    return null;
                  },
                ),
                ReusableFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  labeltext: "Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a email";
                    }
                    return null;
                  },
                ),
                ReusableFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.go,
                  labeltext: "Password",
                  validation: true,
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a password";
                    } else if (!ImportantKey.passwordCheck.hasMatch(value)) {
                      return "Enter a password";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: kPrimaryVoiletColor,
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Text("hello")
                  ],
                )
              ],
            )),
      ),
    );
  }
}
