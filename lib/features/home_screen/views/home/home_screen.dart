import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/image_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ReuseableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 0),
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.r),
                ),
                gradient: containergradient,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 24.r,
                        backgroundColor: kPrimaryVoiletColor,
                        child: CircleAvatar(
                          radius: 22.r,
                          backgroundColor: kvverylightColor,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundImage:
                                Image.asset(ImagePath.profileImage).image,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kwhitelightColor,
                          ),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: kPrimaryVoiletColor,
                              ),
                            ),
                            Text(
                              "October",
                              style: textTheme.bodyLarge!.copyWith(
                                fontSize: title3,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notifications_active,
                                color: kPrimaryVoiletColor,
                                size: 24.h,
                              )))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
