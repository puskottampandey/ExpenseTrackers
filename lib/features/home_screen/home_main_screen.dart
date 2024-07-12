import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:expensetracker/constants.dart';
import 'package:expensetracker/features/home_screen/views/budget/budget_screen.dart';
import 'package:expensetracker/features/home_screen/views/home/home_screen.dart';
import 'package:expensetracker/features/home_screen/views/profile/profile_screen.dart';
import 'package:expensetracker/features/home_screen/views/transaction/transaction_screen.dart';
import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final currentindex = StateProvider((ref) => 0);

class HomeScreenMain extends ConsumerWidget {
  const HomeScreenMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(currentindex);

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
        floatingActionButton: Ink(
            height: 40.h,
            width: 20.w,
            decoration: const BoxDecoration(
              color: kPrimaryVoiletColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: kvverylightColor,
            )),
        bottomnavigationWidget: AnimatedBottomNavigationBar.builder(
            onTap: (index) {
              ref.read(currentindex.notifier).state = index;
            },
            activeIndex: index,
            itemCount: iconList.length,
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            // notchSmoothness: NotchSmoothness.verySmoothEdge,
            tabBuilder: (int index, isActive) {
              return Column(
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
              // activeColor: kPrimaryVoiletColor,
              // inactiveColor: kPrimarylightColor,
              // iconSize: 30.sp,
              // icons: iconList,
              // activeIndex: index,
              // gapLocation: GapLocation.center,
              // notchSmoothness: NotchSmoothness.softEdge,

              // onTap: (index) {
              //   print(index);
              //   ref.read(currentindex.notifier).state = index;
              // }),
            }),
        child: screens[index]
        //  Center(creens
        //   child: const Text("hello"),
        // ),
        );
  }
}
