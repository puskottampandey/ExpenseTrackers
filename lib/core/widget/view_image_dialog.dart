import 'package:expensetracker/core/constants/costant_assets.dart';
import 'package:expensetracker/core/image/custom_network_image.dart';
import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:expensetracker/core/widget/wrapper/common_dialog_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
viewImageDialog(context, image) {
  return showDialog(
    context: context,
    builder: ((context) => CommonDialogWrapper(
          // shape: RoundedRectangleBorder(
          //   borderRadius:
          //       BorderRadius.circular(5.0), // Set your desired radius here
          // ),
          insetPadding: EdgeInsets.symmetric(
              horizontal: AppThemes.symmetricHozPadding.w, vertical: 20.h),
          child: InteractiveViewer(
            panEnabled: true, // Set it to false
            boundaryMargin: const EdgeInsets.all(0),
            minScale: 1,
            maxScale: 3,
            child: CustomNetWorkImage(
              placeholder: Assets.placeholder,
              url: image ?? "",
              fit: BoxFit.contain,
            ),
          ),
        )),
  );
}
