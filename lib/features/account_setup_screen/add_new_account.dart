import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/button.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/global/reuseable/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final name = AutoDisposeProvider((ref) => TextEditingController());
final bank = AutoDisposeProvider((ref) => TextEditingController());
final bankDetails = StateProvider((ref) => false);
final autobank = StateProvider((ref) => "");

class AddNewAccount extends ConsumerWidget {
  final List<String> _list = ["Global", "Kumari", "Sanima"];
  AddNewAccount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = ref.watch(name);
    final bankController = ref.watch(bank);
    final detailsController = ref.watch(bankDetails);
    final bankfilled = ref.watch(autobank);
    bankController.text = bankfilled;
    return ReuseableScaffold(
      changeColor: true,
      color: kPrimaryVoiletColor,
      appbar: true,
      text: "Add New Account",
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
                      "Balance",
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
                height: 300.h,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                  child: Column(
                    children: [
                      ReusableFormField(
                        hint: "Name",
                        controller: nameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      ReusableFormField(
                        readonly: true,
                        controller: bankController,
                        hint: "Bank",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        sufixIcon: GestureDetector(
                          onTap: () {
                            ref.read(bankDetails.notifier).state =
                                !ref.read(bankDetails.notifier).state;
                          },
                          child: const Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Enter a bank";
                          }
                          return null;
                        },
                      ),
                      detailsController
                          ? Wrap(
                              spacing: 6,
                              runSpacing: 10,
                              children: List.generate(_list.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    ref.read(autobank.notifier).state =
                                        _list[index];
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: kseconadarylightColor),
                                        borderRadius:
                                            BorderRadius.circular(8.r)),
                                    child: Text(
                                      _list[index],
                                      style: textTheme.bodyLarge!.copyWith(
                                        fontSize: regular3,
                                        color: kPrimaryDarkColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )
                          : Container(),
                      SizedBox(
                        height: 20.h,
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
