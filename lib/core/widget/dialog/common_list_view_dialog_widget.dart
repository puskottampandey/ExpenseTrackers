// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:starter/core/cubit/data_state.dart';
// import 'package:starter/core/theme/theme_import.dart';
// import 'package:starter/core/utils/check_locale.dart';
// import 'package:starter/core/widget/button/custom_icon_button.dart';
// import 'package:starter/core/widget/common_error_widget.dart';
// import 'package:starter/core/widget/dialog/dialog_text_tile.dart';
// import 'package:starter/core/widget/shimmer/shimmer_widget.dart';
// import 'package:starter/feature/address/domain/entities/province.dart';
// import 'package:starter/feature/address/presentation/bloc/province_cubit.dart';

// commonListDialog({
//   required BuildContext context,
//   required ValueChanged onChange,
// }) {
//   showDialog(
//       context: context,
//       builder: ((context) => CommonListViewDialogWidget(
//             onChange: onChange,
//           )));
// }

// class CommonListViewDialogWidget extends StatefulWidget {
//   final ValueChanged onChange;
//   // final String title;

//   const CommonListViewDialogWidget({
//     super.key,
//     required this.onChange,
//     // required this.title,
//   });

//   @override
//   State<CommonListViewDialogWidget> createState() =>
//       _CommonListViewDialogWidgetState();
// }

// class _CommonListViewDialogWidgetState
//     extends State<CommonListViewDialogWidget> {
//   @override
//   void initState() {
//     final bloc = context.read<ProvinceCubit>();

//     super.initState();

//     if (bloc.state is! CommonLoading && bloc.state is! CommonDataFetchSuccess) {
//       bloc.getProvince();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       insetPadding: EdgeInsets.symmetric(
//           horizontal: AppThemes.symmetricHozPadding.w, vertical: 20.h),
//       child: Stack(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Province",
//                       style: textTheme.displaySmall,
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.h,
//                 ),
//                 Expanded(
//                   child: BlocBuilder<ProvinceCubit, CommonState>(
//                     builder: (context, state) {
//                       if (state is CommonLoading) {
//                         return const Material(child: ListViewPlaceHolder());
//                       } else if (state is CommonError) {
//                         return CommonErrorWidget(message: state.message);
//                       } else if (state is CommonDataFetchSuccess<Province>) {
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Expanded(
//                               child: ListView(
//                                 children: List.generate(
//                                   state.data.length,
//                                   (index) => DialogTextTile(
//                                     name: CheckLocal.isEnglish()
//                                         ? state.data[index].provinceTitle
//                                         : state.data[index].provinceTitleNepali,
//                                     callBack: () {
//                                       widget.onChange(state.data[index]);
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       }
//                       return const SizedBox();
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//               top: 10,
//               right: 10,
//               child: CustomIconButton(
//                 icon: Icons.cancel,
//                 iconColor: CustomColors.midGrayColor,
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ))
//         ],
//       ),
//     );
//   }
// }

// class ProvinceWrapper extends StatelessWidget {
//   final Widget child;
//   const ProvinceWrapper({super.key, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProvinceCubit, CommonState>(
//       builder: (context, state) {
//         return child;
//       },
//     );
//   }
// }
