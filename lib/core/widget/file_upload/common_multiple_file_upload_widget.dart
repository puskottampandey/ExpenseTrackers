// import 'dart:io';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mime/mime.dart';
// import 'package:expensetracker/core/config/env.dart';
// import 'package:expensetracker/core/widget/app_bar/custom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MultipleFileUploadWidget extends StatefulWidget {
//   final String label;
//   final bool isDisable;
//   final bool isRequired;
//   final String? helperText;

//   final List<ValueNotifier<File>> media;

//   final List<ValueNotifier<Media>> alreadyUploadedMedia;

//   final Function(Media media) deleteAlreadyUploadMedia;
//   final List<String> supportedExtensions;

//   final Function() onChangeMedia;

//   const MultipleFileUploadWidget({
//     super.key,
//     required this.label,
//     required this.isRequired,
//     this.helperText,
//     required this.supportedExtensions,
//     this.isDisable = false,
//     required this.media,
//     required this.alreadyUploadedMedia,
//     required this.deleteAlreadyUploadMedia,
//     required this.onChangeMedia,
//   });

//   @override
//   State<MultipleFileUploadWidget> createState() =>
//       _MultipleFileUploadWidgetState();
// }

// class _MultipleFileUploadWidgetState extends State<MultipleFileUploadWidget> {
//   List<ValueNotifier<String>> mediaWithTypes = [];
//   Widget? filePreview;

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     final key = RepositoryProvider.of<Env>(context).apiKey;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           height: 8.h,
//         ),
//         Row(
//           children: [
//             SizedBox(
//                 child: CustomRoundedButton(
//                     height: 34.h,
//                     title: widget.label,
//                     borderRadius: 5,
//                     icon: Icons.file_copy,
//                     iconColor: Theme.of(context).primaryColor,
//                     outlineColor: Theme.of(context).primaryColor,
//                     color: CustomColors.white,
//                     verticalPadding: 8,
//                     textColor: CustomColors.black,
//                     elevation: 0,
//                     onPressed: () async {
//                       final totalFiles = widget.media.length +
//                           widget.alreadyUploadedMedia.length;
//                       FocusScope.of(context).unfocus();

//                       await Future.delayed(const Duration(milliseconds: 100));
//                       if (totalFiles >= 10) {
//                         return;
//                       }
//                       File? res = await FilePickerUtils.pickFile(
//                           widget.supportedExtensions);
//                       if (res != null) {
//                         String type = '';
//                         String _fileType = lookupMimeType(res.path) ?? "";
//                         if (_fileType.contains("image/")) {
//                           type = "image";
//                         } else if (_fileType.contains("application/")) {
//                           type = "application";
//                           filePreview = Image.asset(Assets.pdf);
//                         }
//                         widget.media.add(ValueNotifier(res));
//                         mediaWithTypes.add(ValueNotifier(type));
//                         widget.onChangeMedia();
//                         setState(() {});
//                       }
//                     })),
//             const Expanded(
//               child: SizedBox(),
//             )
//           ],
//         ),
//         SizedBox(height: 5.h),
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
//                                     width: 80,
//                                     height: 80,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(5),
//                                       color: Colors.black12,
//                                     ),
//                                     child: value.isImage
//                                         ? CustomNetWorkImage(
//                                             url: value.path,
//                                             width: 150,
//                                             height: 100,
//                                             fit: BoxFit.cover,
//                                           )
//                                         : Image.asset(
//                                             Assets.pdf,
//                                             fit: BoxFit.cover,
//                                           ));
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
//                         ValueListenableBuilder<File?>(
//                             valueListenable: data,
//                             builder: ((context, fileListenerValue, child) {
//                               return Container(
//                                   height: 90,
//                                   width: 80,
//                                   decoration: BoxDecoration(
//                                       color: CustomColors.lightGray,
//                                       borderRadius: BorderRadius.circular(5),
//                                       border: Border.all(
//                                           width: 0.1,
//                                           color: CustomColors.black)),
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(5),
//                                     child: ValueListenableBuilder<String>(
//                                         valueListenable: mediaWithTypes[index],
//                                         builder: ((context, fileTypeListener,
//                                             child) {
//                                           if (fileListenerValue != null) {
//                                             if (fileTypeListener ==
//                                                 "application") {
//                                               if (filePreview != null) {
//                                                 return filePreview!;
//                                               } else {
//                                                 return const SizedBox();
//                                               }
//                                             } else if (fileTypeListener ==
//                                                 "image") {
//                                               return Image(
//                                                 image: FileImage(
//                                                     fileListenerValue),
//                                                 fit: BoxFit.cover,
//                                               );
//                                             } else {
//                                               return const SizedBox();
//                                             }
//                                           }
//                                           return const SizedBox();
//                                         })),
//                                   ));
//                             })),
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
//                                 mediaWithTypes.removeAt(index);
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
//           width: 200.w,
//           // height: 15.h,
//           child: TextFormField(
//             style: const TextStyle(fontSize: 1),
//             readOnly: true,
//             decoration: const InputDecoration.collapsed(hintText: ""),
//             validator: (value) {
//               {
//                 if (!widget.isRequired) {
//                   return null;
//                 } else if (widget.alreadyUploadedMedia.isEmpty &&
//                     widget.media.isEmpty) {
//                   return "Required Document";
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
