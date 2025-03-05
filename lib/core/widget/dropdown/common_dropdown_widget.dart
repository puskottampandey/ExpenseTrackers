import 'package:expensetracker/core/common_model/multi_language.dart';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/check_locale.dart';
import 'package:expensetracker/core/widget/dropdown/bottom_sheet_wrapper.dart';

showCommonDropDownBottomSheet<T>({
  required BuildContext context,
  required String title,
  required ValueChanged<T> onChange,
  required List<T> valueList,
  required String Function(T) getName,
  required String Function(T) getNameNepali,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) => CommonBottomSheetMultiLang(
      title: title,
      onChange: onChange,
      valueList: valueList,
      getName: getName,
      getNameNepali: getNameNepali,
    ),
  );
}

class CommonBottomSheetMultiLang<T> extends StatelessWidget {
  final String title;
  final ValueChanged<T> onChange;
  final List<T> valueList;
  final String Function(T) getName;
  final String Function(T) getNameNepali;

  const CommonBottomSheetMultiLang({
    super.key,
    required this.title,
    required this.onChange,
    required this.valueList,
    required this.getName,
    required this.getNameNepali,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BottomSheetWrapper(
      height: MediaQuery.of(context).size.height * 0.5,
      header: Column(
        children: [
          Text(title,
              style:
                  textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 10.h),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              valueList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    onChange(valueList[index]);
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 2, color: CustomColors.lightGray),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.h),
                        Text(
                          CheckLocal.check(
                            MultiLanguage(
                              en: getName(valueList[index]),
                              ne: getNameNepali(valueList[index]),
                            ),
                          ),
                          style: textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
