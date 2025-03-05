// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import 'package:starter/core/common_model/media.dart';
// import 'package:starter/core/config/env.dart';
// import 'package:starter/core/theme/theme_import.dart';
// import 'package:starter/core/utils/file_picker/image_picker.dart';
// import 'package:starter/core/utils/permission_handler_utils.dart';
// import 'package:starter/core/widget/button/custom_icon_button.dart';
// import 'package:starter/core/widget/button/custom_rounded_button.dart';
// import 'package:starter/feature/profile/presentation/widget/image_picker_buttom_sheet.dart';

// class MultipleMediaFieldWidget extends StatefulWidget {
//   final String? title;
//   final List<ValueNotifier<File>> media;

//   final List<ValueNotifier<Media>> alreadyUploadedMedia;

//   final Function(Media media) deleteAlreadyUploadMedia;

//   final bool isRequired;

//   final bool isVideoAllowed;

//   final Function() onChangeMedia;

//   const MultipleMediaFieldWidget({
//     super.key,
//     required this.alreadyUploadedMedia,
//     required this.media,
//     this.title,
//     required this.deleteAlreadyUploadMedia,
//     this.isRequired = false,
//     required this.onChangeMedia,
//     this.isVideoAllowed = false,
//   });

//   @override
//   State<MultipleMediaFieldWidget> createState() =>
//       _MultipleMediaFieldWidgetState();
// }

// class _MultipleMediaFieldWidgetState extends State<MultipleMediaFieldWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     final key = RepositoryProvider.of<Env>(context).apiKey;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CustomRoundedButton(
//               height: 35.h,
//               title: widget.title ?? "Add Image",
//               borderRadius: 5,
//               icon: Icons.image_outlined,
//               iconColor: Theme.of(context).primaryColor,
//               outlineColor: Theme.of(context).primaryColor,
//               color: CustomColors.white,
//               verticalPadding: 8,
//               textColor: CustomColors.black,
//               elevation: 0,
//               onPressed: () async {
//                 FocusScope.of(context).unfocus();
//                 await Future.delayed(const Duration(milliseconds: 100));
//                 showImagePickerBottomSheet(onGalleryPressed: () async {
//                   final res = await ImagePickerUtils.getGallery();
//                   Future.sync(() {
//                     context.pop();
//                   });
//                   if (res != null) {
//                     widget.media.add(ValueNotifier(res));
//                     setState(() {});
//                     widget.onChangeMedia();
//                   }
//                 }, onCameraPressed: () async {
//                   await PermissionHandlerUtils.cameraPermission();
//                   final res = await ImagePickerUtils.getCamera();
//                   if (res != null) {
//                     widget.media.add(ValueNotifier(res));
//                     widget.onChangeMedia();
//                     setState(() {});
//                   }
//                   Future.sync(() {
//                     context.pop();
//                   });
//                 });
//               },
//             ),
//             SizedBox(
//               width: 4.w,
//             ),
//             if (widget.isRequired)
//               Text(
//                 "* ",
//                 style: textTheme.headlineSmall!.copyWith(
//                   color: CustomColors.red,
//                 ),
//               )
//           ],
//         ),
//         Wrap(
//             runSpacing: 10.h,
//             spacing: 10.w,
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//               ...List.generate(
//                 widget.alreadyUploadedMedia.length,
//                 (index) {
//                   final data = widget.alreadyUploadedMedia[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Stack(
//                       children: [
//                         Container(
//                           color: CustomColors.lightGray,
//                           child: ValueListenableBuilder<Media>(
//                               valueListenable: data,
//                               builder: ((context, value, child) {
//                                 return Container(
//                                   width: 90,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: Colors.black12,
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                           value.path,
//                                           headers: {
//                                             "x-api-key": key,
//                                           },
//                                         ),
//                                         fit: BoxFit.cover),
//                                   ),
//                                 );
//                               })),
//                         ),
//                         Positioned(
//                           top: 3,
//                           right: 3,
//                           child: CustomIconButton(
//                             backgroundColor: CustomColors.lighterGrey,
//                             icon: Icons.cancel,
//                             verticalPadding: 5,
//                             horizontalPadding: 5,
//                             iconSize: 12,
//                             iconColor: CustomColors.red,
//                             onPressed: () async {
//                               widget.deleteAlreadyUploadMedia(
//                                   widget.alreadyUploadedMedia[index].value);
//                               widget.alreadyUploadedMedia.removeAt(index);
//                               setState(() {});

//                               widget.onChangeMedia();
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               ...List.generate(
//                 widget.media.length,
//                 (index) {
//                   final data = widget.media[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(4.0),
//                     child: Stack(
//                       children: [
//                         Container(
//                           color: CustomColors.lightGray,
//                           child: ValueListenableBuilder<File?>(
//                               valueListenable: data,
//                               builder: ((context, value, child) {
//                                 return Container(
//                                   width: 90,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(5),
//                                     color: Colors.black12,
//                                     image: value == null
//                                         ? null
//                                         : DecorationImage(
//                                             image: FileImage(
//                                               value,
//                                             ),
//                                             fit: BoxFit.cover),
//                                   ),
//                                 );
//                               })),
//                         ),
//                         Positioned(
//                             top: 3,
//                             right: 3,
//                             child: CustomIconButton(
//                               backgroundColor: CustomColors.lighterGrey,
//                               icon: Icons.cancel,
//                               verticalPadding: 5,
//                               horizontalPadding: 5,
//                               iconSize: 12,
//                               iconColor: CustomColors.red,
//                               onPressed: () async {
//                                 widget.media.removeAt(index);
//                                 setState(() {});
//                                 widget.onChangeMedia();
//                               },
//                             ))
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ]),
//         SizedBox(
//           width: 100.w,
//           height: 20.h,
//           child: TextFormField(
//             readOnly: true,
//             style: const TextStyle(
//               fontSize: 0,
//             ),
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               hintText: "",
//               errorStyle: const TextStyle(inherit: true, fontSize: 13),
//             ),
//             validator: (value) {
//               {
//                 if (!widget.isRequired) {
//                   return null;
//                 } else if (widget.alreadyUploadedMedia.isEmpty &&
//                     widget.media.isEmpty) {
//                   return "Media is required";
//                 } else {
//                   return null;
//                 }
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
