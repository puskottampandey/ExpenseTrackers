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

// // ignore: must_be_immutable
// class SingleMediaField extends StatefulWidget {
//   final String? title;
//   final IconData icon;
//   ValueNotifier<File?> media;
//   final bool isRequired;
//   GlobalKey<FormState>? formKey;

//   ValueNotifier<Media?> alreadyUploadedMedia;

//   final Function() deleteAlreadyUploadMedia;
//   final Function(File? media) onChangeMedia;

//   SingleMediaField({
//     super.key,
//     required this.alreadyUploadedMedia,
//     required this.media,
//     this.title,
//     required this.onChangeMedia,
//     required this.deleteAlreadyUploadMedia,
//     this.icon = Icons.image_outlined,
//     this.isRequired = true,
//     this.formKey,
//   });

//   @override
//   State<SingleMediaField> createState() => _MediaFieldWidgetState();
// }

// class _MediaFieldWidgetState extends State<SingleMediaField> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final key = RepositoryProvider.of<Env>(context).apiKey;

//     final textTheme = Theme.of(context).textTheme;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomRoundedButton(
//               height: 34.h,
//               title: widget.title ?? "Add Image",
//               borderRadius: 5,
//               icon: widget.icon,
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
//                   FocusScope.of(context).unfocus();
//                   final res = await ImagePickerUtils.getGallery();
//                   Future.sync(() {
//                     context.pop();
//                   });
//                   if (res != null) {
//                     widget.onChangeMedia(res);
                
//                     setState(() {});
//                   }
//                 }, onCameraPressed: () async {
//                   await PermissionHandlerUtils.cameraPermission();
//                   final res = await ImagePickerUtils.getCamera();
//                   if (res != null) {
                    
//                     widget.onChangeMedia(res);
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
      
//         if (widget.alreadyUploadedMedia.value != null ||
//             widget.media.value != null)
//           SizedBox(
//             height: 10.h,
//           ),
//         Wrap(
//             runSpacing: 10.h,
//             spacing: 10.w,
//             crossAxisAlignment: WrapCrossAlignment.center,
//             children: [
//               if (widget.alreadyUploadedMedia.value != null)
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Stack(
//                     children: [
//                       Container(
//                         color: CustomColors.lightGray,
//                         child: ValueListenableBuilder<Media?>(
//                             valueListenable: widget.alreadyUploadedMedia,
//                             builder: ((context, value, child) {
//                               return Container(
//                                 width: 90,
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.black12,
//                                   image: DecorationImage(
//                                       image: NetworkImage(
//                                         value?.path ?? "",
//                                         headers: {
//                                           "x-api-key": key,
//                                         },
//                                       ),
//                                       fit: BoxFit.cover),
//                                 ),
//                               );
//                             })),
//                       ),
//                       Positioned(
//                         top: 3,
//                         right: 3,
//                         child: CustomIconButton(
//                           backgroundColor: CustomColors.lighterGrey,
//                           icon: Icons.cancel,
//                           verticalPadding: 5,
//                           horizontalPadding: 5,
//                           iconSize: 12,
//                           iconColor: CustomColors.red,
//                           onPressed: () async {
//                             if (widget.alreadyUploadedMedia.value != null) {
//                               widget.deleteAlreadyUploadMedia();
//                             } 
//                             setState(() {});
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               if (widget.media.value != null)
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Stack(
//                     children: [
//                       Container(
//                         color: CustomColors.lightGray,
//                         child: ValueListenableBuilder<File?>(
//                             valueListenable: widget.media,
//                             builder: ((context, value, child) {
//                               return Container(
//                                 width: 90,
//                                 height: 80,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.black12,
//                                   image: value == null
//                                       ? null
//                                       : DecorationImage(
//                                           image: FileImage(
//                                             value,
//                                           ),
//                                           fit: BoxFit.cover),
//                                 ),
//                               );
//                             })),
//                       ),
//                       Positioned(
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
//                               widget.onChangeMedia(null);
                             
//                             },
//                           ),)
//                     ],
//                   ),
//                 )
//             ]),
//         Container(
//           // color: Colors.yellow,
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
//               errorStyle: TextStyle(inherit: true, fontSize: 13),
//             ),
//             // decoration: const InputDecoration.collapsed(hintText: ""),
//             validator: (value) {
//               {
//                 // if (!enalbleFileValidation) {
//                 //   return null;
//                 // }
//                 if (!widget.isRequired) {
//                   return null;
//                 } else if (widget.alreadyUploadedMedia.value == null &&
//                     widget.media.value == null) {
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
