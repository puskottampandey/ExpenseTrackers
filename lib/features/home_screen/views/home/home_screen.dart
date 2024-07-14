import 'package:expensetracker/global/reuseable/scaffoldscreen.dart';
import 'package:expensetracker/constants.dart';
import 'package:expensetracker/global/reuseable/image_path.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final changedindex = StateProvider((ref) => 0);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listday = [
      "Today",
      "Week",
      "Month",
      "Year",
    ];
    final currentIndex = ref.watch(changedindex);
    return ReuseableScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 16.h),
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
                        radius: 22.r,
                        backgroundColor: kPrimaryVoiletColor,
                        child: CircleAvatar(
                          radius: 20.r,
                          backgroundColor: kvverylightColor,
                          child: CircleAvatar(
                            radius: 18.r,
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
                                fontSize: regular2,
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
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Account Balance",
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: regular2,
                      color: kPrimarylightColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    "Rs. 90000",
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: title0,
                      color: kPrimaryDarkColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      rowContainer(
                          color: kPrimaryGreenColor,
                          icon: Icons.upgrade,
                          text: "Income",
                          number: "Rs. 12000"),
                      rowContainer(
                          color: kPrimaryRedColor,
                          icon: Icons.downloading,
                          text: "Expense",
                          number: "Rs. 12000")
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 16.w,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Spend Frequency",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: title3,
                          color: kPrimaryDarkColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    listday[currentIndex],
                    style: textTheme.bodyLarge!.copyWith(
                      fontSize: title3,
                      color: kPrimaryDarkColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  lineChart(),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 40.h,
                    child: listContainer(listday, ref, currentIndex),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Transaction",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: title3,
                          color: kPrimaryDarkColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 16.w),
                        decoration: BoxDecoration(
                            color: kvveryViloetlightColor,
                            borderRadius: BorderRadius.circular(16.r)),
                        child: Text(
                          "See All",
                          style: textTheme.bodyLarge!.copyWith(
                            fontSize: regular3,
                            color: kPrimaryVoiletColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  listTransaction()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView listTransaction() {
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              decoration: BoxDecoration(
                color: _getColor(index),
                borderRadius: BorderRadius.circular(
                  16.r,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              child: const Icon(
                Icons.badge,
                color: kPrimaryYellowColor,
              ),
            ),
            title: Text(
              "Shopping",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: regular2,
                color: kseconadaryDarkColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Buy some vegetables",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: regular3,
                color: kPrimarylightColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "-Rs.200",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: regular2,
                    color: kPrimaryRedColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "10:00 Am",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: regular3,
                    color: kPrimarylightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        });
  }

  ListView listContainer(
      List<String> listday, WidgetRef ref, int currentIndex) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listday.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            ref.read(changedindex.notifier).state = index;
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration: currentIndex == index
                ? BoxDecoration(
                    color: currentIndex == index
                        ? kverylightYellowColor
                        : kseconadarylightColor,
                    borderRadius: BorderRadius.circular(16.r))
                : null,
            child: Center(
              child: Text(
                listday[index],
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: regular3,
                  color: currentIndex == index
                      ? kPrimaryYellowColor
                      : kverylightDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AspectRatio lineChart() {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        LineChartData(
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
                spots: const [
                  FlSpot(1, 1000),
                  FlSpot(4, 200),
                  FlSpot(6, 1000),
                  FlSpot(8, 500),
                  FlSpot(10, 300),
                ],
                isCurved: true,
                barWidth: 4.w,
                shadow: const Shadow(color: kPrimaryVoiletColor),
                color: kPrimaryVoiletColor,
                curveSmoothness: 0.2,
                isStrokeCapRound: true,
                dotData: const FlDotData(
                  show: false,
                ),
                belowBarData: BarAreaData(
                  color: klightVioletColor,
                  show: true,
                )),
          ],
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        kPrimaryBlueColor;
        break;
      case 1:
        kPrimaryGreenColor;
        break;
      case 2:
        kPrimaryGreenColor;
        break;
      default:
        kPrimaryVoiletColor;
    }
    return kPrimaryGreenColor;
  }

  Container rowContainer(
      {Color? color, IconData? icon, String? text, String? number}) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            28.r,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                  color: kvverylightColor,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Icon(
                icon,
                color: color,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text!,
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: regular2,
                    color: kvverylightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  number!,
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: title3,
                    color: kvverylightColor,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            )
          ],
        ));
  }
}
