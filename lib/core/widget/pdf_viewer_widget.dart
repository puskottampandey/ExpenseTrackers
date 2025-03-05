import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerWidget extends StatelessWidget {
  final String pdfPath;

  const PdfViewerWidget({
    super.key,
    required this.pdfPath,
  });

  @override
  Widget build(BuildContext context) {
    final key = RepositoryProvider.of<Env>(context).apiKey;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "Pdf",
      ),
      body: SfPdfViewer.network(
        headers: {
          "x-api-key": key,
        },
        pdfPath,
      ),
    );
  }
}

// class PdfViewerCard extends StatelessWidget {
//   final String pdfPath;
//   const PdfViewerCard({super.key, required this.pdfPath});

//   @override
//   Widget build(BuildContext context) {
//     final key = RepositoryProvider.of<Env>(context).apiKey;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//               border: Border.all(width: 1, color: CustomColors.lightGray)),
//           height: 400.h,
//           child: SfPdfViewer.network(
//             pdfPath,
//             headers: {
//               "x-api-key": key,
//             },
//           ),
//         ),
//         SizedBox(height: 10.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             TextButton(
//                 onPressed: () {
//                   NavigationService.push(
//                       target: PdfViewerWidget(pdfPath: pdfPath));
//                 },
//                 child: Row(
//                   children: [
//                     Text(
//                       LocaleKeys.viewPdfInFullPage.tr(),
//                     ),
//                     const Icon(
//                       Icons.arrow_forward,
//                       size: 15,
//                     )
//                   ],
//                 )),

//             // CustomOutlineButton(
//             //   title: LocaleKeys.viewPdfInFullPage.tr(),
//             //   verticalPadding: 5,
//             // )
//           ],
//         )
//       ],
//     );
//   }
// }
