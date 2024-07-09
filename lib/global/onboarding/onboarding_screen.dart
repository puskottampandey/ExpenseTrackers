import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/onboarding/model/onboarding_model.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final currentPage = StateProvider((ref) => 0);

// ignore: must_be_immutable
class OnboardingScreen extends ConsumerWidget {
  OnboardingScreen({super.key});

  PageController controller = PageController(initialPage: 0);

  List<Onboarding> onboarding = [
    Onboarding(
        image: "assets/images/Animation2.json",
        title: "Gain total control of your money",
        des: "Become your own money manager and make every cent count"),
    Onboarding(
        image: "assets/images/Animation1.json",
        title: "Know where your money goes",
        des:
            "Track your transaction easily, with categories and financial report"),
    Onboarding(
        image: "assets/images/Animation 3.json",
        title: "Planning ahead",
        des: "Setup your budget for each category so you in control"),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(currentPage);
    return ReuseableScaffold(
        child: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: controller,
                    onPageChanged: (value) {
                      ref.read(currentPage.notifier).state = value;
                    },
                    itemCount: onboarding.length,
                    itemBuilder: (BuildContext context, int index) {
                      final data = onboarding[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            data.image.toString(),
                          ),
                          Text(
                            data.title.toString(),
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: title2,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            data.des.toString(),
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: regular2,
                              color: kPrimarylightColor,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
              SmoothPageIndicator(
                controller: controller,
                count: onboarding.length,
                effect: const WormEffect(
                  activeDotColor: kPrimaryVoiletColor,
                ),
              ),
              SizedBox(
                height: 100.h,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ReuseableButton(
                    minimumSize: Size(300.w, 40.h),
                    bgcolor: kPrimaryVoiletColor,
                    text: current == 2 ? "Sign Up" : "Continue",
                    textcolor: kvverylightColor,
                    ontap: () {
                      if (current == 2) {
                        context.go('/signup');
                      } else {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    },
                  )),
              SizedBox(
                height: 10.h,
              ),
              current == 2
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: ReuseableButton(
                        minimumSize: Size(300.w, 40.h),
                        text: "Login",
                        textcolor: kPrimaryVoiletColor,
                        ontap: () {
                          context.go('/login');
                        },
                        bgcolor: kvveryViloetlightColor,
                      ))
                  : Container(height: 40.h)
            ],
          ),
        ),
      ),
    ));
  }
}
