import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/widget/button/custom_rounded_button.dart';

permissionAlertDialog({required String title, required String subtitle}) {
  showDialog(
    context: NavigationService.context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(subtitle),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const  Text("Cancel"),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: SizedBox(
                  height: 34,
                  child: CustomRoundedButton(
                    title: "Open app settings",
                    onPressed: () {
                      openAppSettings();
                      Navigator.pop(context);
                    },
                    fontSize: 12,
                    padding: EdgeInsets.zero,
                  ),
                ),
              )
            ],
          )
        ],
      );
    },
  );
}
