import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/text_utils.dart';
import 'package:expensetracker/core/widget/expandable/common_expandable_widget.dart';

class CommonExpandableListWidget extends StatelessWidget {
  final String title;
  final Widget body;
  final bool hasShadow;
  final int index;
  final double bodyPadding;
  final Color? bgColor;
  const CommonExpandableListWidget(
      {super.key,
      required this.title,
      required this.index,
      required this.body,
      this.bodyPadding = 34,
      this.bgColor,
      this.hasShadow = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: CommonExpandableWidget(
        bgColor: Colors.white,
        header: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        color: CustomColors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 2,
                              spreadRadius: 2,
                              color: CustomColors.lightGray)
                        ]),
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      "${"${index + 1}".toNepali()}.",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: bodyPadding.w,
                  ),
                  Expanded(
                    child: body,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
