import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:expensetracker/constants.dart';
import 'package:expensetracker/features/home_screen/views/budget/budget_screen.dart';
import 'package:expensetracker/features/home_screen/views/home/home_screen.dart';
import 'package:expensetracker/features/home_screen/views/profile/profile_screen.dart';
import 'package:expensetracker/features/home_screen/views/transaction/transaction_screen.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final currentindex = StateProvider((ref) => 0);
final stacktapped = StateProvider((ref) => false);

class HomeScreenMain extends ConsumerWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentindex);
    final stackchanged = ref.watch(stacktapped);

    final List<Widget> screens = [
      const HomeScreen(),
      const TransactionScreen(),
      const BudgetScreen(),
      const ProfileScreen(),
    ];

    final iconList = [
      Icons.home,
      Icons.cyclone,
      Icons.pie_chart,
      Icons.person,
    ];
    final iconName = [
      "Home",
      "Trasaction",
      "Budget",
      "Profile",
    ];
    return ReuseableScaffold(
        bottomnavigation: true,
        floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            backgroundColor: kPrimaryVoiletColor,
            onPressed: () {
              ref.read(stacktapped.notifier).state =
                  !ref.read(stacktapped.notifier).state;
            },
            child: stackchanged
                ? Icon(
                    Icons.close,
                    color: kvverylightColor,
                    size: 24.sp,
                  )
                : Icon(
                    Icons.add,
                    color: kvverylightColor,
                    size: 24.sp,
                  )),
        bottomnavigationWidget: AnimatedBottomNavigationBar.builder(
            onTap: (index) {
              ref.read(currentindex.notifier).state = index;
            },
            activeIndex: index,
            itemCount: iconList.length,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            tabBuilder: (int index, isActive) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    iconList[index],
                    color: isActive ? kPrimaryVoiletColor : kPrimarylightColor,
                  ),
                  Text(
                    iconName[index],
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: regular3,
                      color:
                          isActive ? kPrimaryVoiletColor : kPrimarylightColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            }),
        child: Stack(
          children: [
            screens[index],
            stackchanged
                ? Positioned(
                    left: 220.w,
                    bottom: 20.h,
                    child: decoratedContainer(
                      color: kPrimaryRedColor,
                      icon: Icons.downloading,
                    ),
                  )
                : Container(),
            stackchanged
                ? Positioned(
                    bottom: 20.h,
                    left: 100.w,
                    child: decoratedContainer(
                      color: kPrimaryGreenColor,
                      icon: Icons.upgrade,
                    ),
                  )
                : Container(),
            stackchanged
                ? Positioned(
                    bottom: 70.h,
                    left: 160.w,
                    child: decoratedContainer(
                        color: kPrimaryBlueColor,
                        icon: Icons.currency_exchange,
                        ontap: () {}),
                  )
                : Container(),
          ],
        ));
  }

  Container decoratedContainer({
    Color? color,
    IconData? icon,
    Function()? ontap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: ontap,
        icon: Icon(
          icon,
          color: kvverylightColor,
        ),
      ),
    );
  }
}
