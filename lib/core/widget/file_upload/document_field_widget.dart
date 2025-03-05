// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:mime/mime.dart';
// import 'package:nagarpalika_services_mobile_app/common/app/theme.dart';
// import 'package:nagarpalika_services_mobile_app/common/constant/constant_assets.dart';
// import 'package:nagarpalika_services_mobile_app/common/image/custom_network_image.dart';
// import 'package:nagarpalika_services_mobile_app/common/utils/file_picker/file_picker.dart';
// import 'package:nagarpalika_services_mobile_app/common/utils/form_validator.dart';
// import 'package:nagarpalika_services_mobile_app/common/utils/media_utils.dart';
// import 'package:nagarpalika_services_mobile_app/common/utils/size_utils.dart';
// import 'package:nagarpalika_services_mobile_app/common/widget/button/custom_icon_button.dart';
// import 'package:nagarpalika_services_mobile_app/common/widget/common_svg_widget.dart';
// import 'package:starter/core/theme/theme_import.dart';
// import 'package:starter/core/utils/form_validator.dart';
// import 'package:starter/core/widget/button/custom_icon_button.dart';

// class DocumentFieldWidget extends StatefulWidget {
//   final String label;
//   final bool isDisable;
//   final bool isRequired;
//   final String? helperText;
//   final String? imageUrl;
//   final Function(File) onChange;
//   final List<String> supportedExtensions;
//   final int maxFileSize;
//   final ValueNotifier<File?>? file;

//   const DocumentFieldWidget({
//     super.key,
//     required this.label,
//     required this.isRequired,
//     required this.onChange,
//     this.helperText,
//     required this.maxFileSize,
//     required this.supportedExtensions,
//     this.imageUrl,
//     this.isDisable = false,
//     this.file,
//   });

//   @override
//   State<DocumentFieldWidget> createState() => _DocumentFieldWidgetState();
// }

// class _DocumentFieldWidgetState extends State<DocumentFieldWidget> {
//   ValueNotifier<File?> file = ValueNotifier(null);
//   final ValueNotifier<String?> fileType = ValueNotifier(null);
//   Widget? filePreveiw;

//   bool enalbleFileValidation = true;

//   @override
//   void initState() {
//     if (widget.imageUrl != null && widget.imageUrl!.isNotEmpty) {
//       setState(() {
//         enalbleFileValidation = false;
//       });
//     }
//     updateInitialFile();
//     super.initState();
//   }

//   updateInitialFile() async {
//     if (widget.file != null && widget.file!.value != null) {
//       String _fileType = lookupMimeType(widget.file!.value!.path) ?? "";
//       if (_fileType.contains("image/")) {
//         fileType.value = "image";
//       } else if (_fileType.contains("application/")) {
//         fileType.value = "application";
//         filePreveiw = const CommonSvgWidget(svgName: Assets.pdf);
//       }
//       file.value = widget.file!.value;
//       file = widget.file!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(5.hp),
//           decoration: BoxDecoration(
//               border: Border.all(
//                 width: 1,
//                 color: CustomTheme.midGrayColor,
//               ),
//               borderRadius: BorderRadius.circular(8)),
//           child: Align(
//             alignment: Alignment.center,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Expanded(
//                     child: Text(
//                         widget.isRequired ? "${widget.label}*" : widget.label)),
//                 Stack(
//                   children: [
//                     SizedBox(
//                       height: 120.hp,
//                       width: 120.wp,
//                     ),
//                     ValueListenableBuilder<File?>(
//                         valueListenable: file,
//                         builder: ((context, fileListnerValue, child) {
//                           return InkWell(
//                             onTap: () async {
//                               FocusScope.of(context).unfocus();
//                               await Future.delayed(
//                                   const Duration(milliseconds: 100));
//                               File? res = await FilePickerUtils.pickFile(
//                                   widget.supportedExtensions);
//                               if (res != null) {
//                                 String _fileType =
//                                     lookupMimeType(res.path) ?? "";
//                                 if (_fileType.contains("image/")) {
//                                   fileType.value = "image";
//                                 } else if (_fileType.contains("application/")) {
//                                   fileType.value = "application";

//                                   final path =
//                                       MediaUtils.checkMediaType(res.path);

//                                   if (path == MediaType.doc) {
//                                     filePreveiw = Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CommonSvgWidget(
//                                           svgName: Assets.doc,
//                                           height: 60.hp,
//                                           width: 60.wp,
//                                           color: CustomTheme
//                                               .primarymaterialcolor.shade400),
//                                     );
//                                   } else {
//                                     filePreveiw = Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: CommonSvgWidget(
//                                           svgName: Assets.pdf,
//                                           height: 60.hp,
//                                           width: 60.wp,
//                                           color: CustomTheme
//                                               .primarymaterialcolor.shade400),
//                                     );
//                                   }
//                                 }
//                                 file.value = res;
//                                 if (widget.imageUrl != null &&
//                                     widget.imageUrl!.isNotEmpty) {
//                                   setState(() {
//                                     enalbleFileValidation = true;
//                                   });
//                                 }
//                                 widget.onChange(res);
//                               }
//                             },
//                             child: Container(
//                                 height: 120.hp,
//                                 width: 120.wp,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.black12,
//                                 ),
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(5),
//                                   child: ValueListenableBuilder<String?>(
//                                       valueListenable: fileType,
//                                       builder:
//                                           ((context, fileTypeListner, child) {
//                                         if (fileListnerValue != null) {
//                                           if (fileTypeListner ==
//                                               "application") {
//                                             if (filePreveiw != null) {
//                                               return filePreveiw!;
//                                             } else {
//                                               return const SizedBox();
//                                             }
//                                           } else if (fileTypeListner ==
//                                               "image") {
//                                             return Image(
//                                               image:
//                                                   FileImage(fileListnerValue),
//                                               fit: BoxFit.contain,
//                                             );
//                                           } else {
//                                             return const SizedBox();
//                                           }
//                                         } else if (widget.imageUrl != null &&
//                                             widget.imageUrl!.isNotEmpty) {
//                                           if (MediaUtils.checkMediaType(
//                                                   widget.imageUrl ?? "") ==
//                                               MediaType.image) {
//                                             return CustomNetWorkImage(
//                                               imageUrl: widget.imageUrl!,
//                                             );
//                                           } else if (MediaUtils.checkMediaType(
//                                                   widget.imageUrl ?? "") ==
//                                               MediaType.pdf) {
//                                             return Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: CommonSvgWidget(
//                                                     svgName: Assets.pdf,
//                                                     height: 60.hp,
//                                                     width: 60.wp,
//                                                     color: CustomTheme
//                                                         .primarymaterialcolor
//                                                         .shade400));
//                                           } else if (MediaUtils.checkMediaType(
//                                                   widget.imageUrl ?? "") ==
//                                               MediaType.doc) {
//                                             return Padding(
//                                                 padding:
//                                                     const EdgeInsets.all(8.0),
//                                                 child: CommonSvgWidget(
//                                                   svgName: Assets.doc,
//                                                   height: 60.hp,
//                                                   width: 60.wp,
//                                                   color: CustomTheme
//                                                       .primarymaterialcolor
//                                                       .shade400,
//                                                 ));
//                                           }
//                                         }
//                                         return const SizedBox();
//                                       })),
//                                 )),
//                           );
//                         })),
//                     widget.isDisable
//                         ? const SizedBox()
//                         : Positioned(
//                             top: 4,
//                             right: 4,
//                             child: CustomIconButton(
//                               backgroundColor: CustomColors.white,
//                               icon: Icons.upload,
//                               iconSize: 18,
//                               iconColor: Theme.of(context).primaryColor,
//                               onPressed: () async {
//                                 FocusScope.of(context).unfocus();
//                                 await Future.delayed(
//                                     const Duration(milliseconds: 100));
//                                 File? res = await FilePickerUtils.pickFile(
//                                     widget.supportedExtensions);
//                                 if (res != null) {
//                                   String _fileType =
//                                       lookupMimeType(res.path) ?? "";
//                                   if (_fileType.contains("image/")) {
//                                     fileType.value = "image";
//                                   } else if (_fileType
//                                       .contains("application/")) {
//                                     fileType.value = "application";
//                                     filePreveiw = const CommonSvgWidget(
//                                         svgName: Assets.pdf);
//                                   }
//                                   file.value = res;
//                                   widget.onChange(res);
//                                 }
//                               },
//                             ))
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           child: TextFormField(
//             style: const TextStyle(fontSize: 1),
//             readOnly: true,
//             decoration: const InputDecoration.collapsed(hintText: ""),
//             validator: (value) {
//               if (!enalbleFileValidation) {
//                 return null;
//               } else {
//                 return FormValidator.fileValidator(
//                     file: file.value,
//                     fieldName: widget.label,
//                     isRequired: widget.isRequired,
//                     size: widget.maxFileSize);
//               }
//             },
//           ),
//         ),
//         SizedBox(
//           height: 20.h,
//         ),
//       ],
//     );
//   }
// }
