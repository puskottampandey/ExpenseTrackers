
import 'package:expensetracker/core/theme/custom_color.dart';

import 'package:expensetracker/core/theme/theme_import.dart';

class DialogTextTile extends StatelessWidget {
  final String name;
  final VoidCallback callBack;
  const DialogTextTile({super.key, required this.name, required this.callBack});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: callBack,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
          ),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: CustomColors.lightGray),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              SizedBox(width: 10.h),
              Expanded(
                child: Text(
                  name,
                  style: textTheme.bodyLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
