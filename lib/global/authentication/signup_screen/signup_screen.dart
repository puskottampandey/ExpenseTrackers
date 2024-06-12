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
    bool check = true;
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
      body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 80.h,
              ),
              const ReusableFormField(
                labeltext: "Name",
              ),
              const ReusableFormField(
                labeltext: "Email",
              ),
              const ReusableFormField(
                labeltext: "Password",
                obscureText: true,
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
    );
  }
}
