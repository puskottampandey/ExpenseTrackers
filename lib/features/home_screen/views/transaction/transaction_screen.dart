import 'package:expensetracker/constants/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final fromController = AutoDisposeProvider((ref) => TextEditingController());
final toController = AutoDisposeProvider((ref) => TextEditingController());
final desController = AutoDisposeProvider((ref) => TextEditingController());

class TransactionScreen extends ConsumerWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final from = ref.watch(fromController);
    final to = ref.watch(toController);
    final des = ref.watch(toController);
    return ReuseableScaffold(
      appbar: true,
      text: "Transactions",
      changeColor: true,
      color: kPrimaryBlueColor,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How much?",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: regular2,
                        color: kPrimarylightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs. 0000.00",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: title1,
                        color: kvverylightColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: kvverylightColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.r),
                        topRight: Radius.circular(32.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ReusableFormField(
                              hint: "Name",
                              controller: from,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: (String? value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Enter a name";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          // Icon(
                          //   Icons.currency_exchange,
                          //   color: kseconadarylightColor,
                          //   size: 20.sp,
                          // ),
                          Flexible(
                            child: ReusableFormField(
                              hint: "Bank",
                              controller: to,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              // validator: (String? value) {
                              //   if (value == null || value.isEmpty) {
                              //     return "Enter a bank";
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ReusableFormField(
                        hint: "Bank",
                        controller: to,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a bank";
                          }
                          return null;
                        },
                      ),
                      ReusableFormField(
                        hint: "Bank",
                        controller: to,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a bank";
                          }
                          return null;
                        },
                      ),
                      ReuseableButton(
                        text: "Continue",
                        textcolor: kvverylightColor,
                        bgcolor: kPrimaryVoiletColor,
                        ontap: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
