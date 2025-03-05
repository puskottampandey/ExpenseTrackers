import 'dart:io';
import 'package:expensetracker/core/constants/costant_assets.dart';
import 'package:expensetracker/core/image/custom_network_image.dart';
import 'package:expensetracker/core/utils/file_picker/file_picker.dart' show FilePickerUtils;
import 'package:expensetracker/core/utils/form_validator.dart';
import 'package:expensetracker/core/widget/button/custom_outline_button.dart';
import 'package:expensetracker/core/widget/svg/common_svg_widget.dart';
import 'package:mime/mime.dart';
import 'package:expensetracker/core/theme/custom_color.dart';
import 'package:expensetracker/core/theme/theme_import.dart';
import 'package:expensetracker/core/utils/text_utils.dart';

class CustomFileUploadWidget extends StatefulWidget {
  final String label;
  final bool isDisable;
  final bool isRequired;
  final String? helperText;
  final String imageUrl;
  final Function(File?) onChange;
  final List<String> supportedExtensions;
  final int maxFileSize;
  final ValueNotifier<File?>? file;

  const CustomFileUploadWidget({
    super.key,
    required this.label,
    required this.isRequired,
    required this.onChange,
    this.helperText,
    required this.maxFileSize,
    required this.supportedExtensions,
    this.imageUrl = "",
    this.isDisable = false,
    this.file,
  });

  @override
  State<CustomFileUploadWidget> createState() => _CustomFileUploadWidgetState();
}

class _CustomFileUploadWidgetState extends State<CustomFileUploadWidget> {
  ValueNotifier<File?> file = ValueNotifier(null);
  final ValueNotifier<String?> fileType = ValueNotifier(null);
  Widget? filePreview;

  String fileUrl = "";

  bool enableFileValidation = true;

  @override
  void initState() {
    if (widget.imageUrl != null && widget.imageUrl.isNotEmpty) {
      setState(() {
        enableFileValidation = false;
      });
    }
    updateInitialFile();
    super.initState();
  }

  updateInitialFile() async {
    if (widget.file != null && widget.file!.value != null) {
      // ignore: no_leading_underscores_for_local_identifiers
      String _fileType = lookupMimeType(widget.file!.value!.path) ?? "";
      if (_fileType.contains("image/")) {
        fileType.value = "image";
      } else if (_fileType.contains("application/")) {
        fileType.value = "application";
        filePreview = const CommonSvgWidget(svgName: "");
      }
      file.value = widget.file!.value;
      file = widget.file!;
    }
    if (widget.imageUrl.isNotEmpty) {
      fileUrl = widget.imageUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.label,
                style: textTheme.headlineSmall!.copyWith(
                    color: CustomColors.grey, fontWeight: FontWeight.w600)),
            if (widget.isRequired)
              Text(
                "*",
                style: textTheme.titleLarge!.copyWith(
                  color: CustomColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            SizedBox(
                child: CustomOutlineButton(
              title: widget.label,
              onPressed: () async {
                FocusScope.of(context).unfocus();
                await Future.delayed(const Duration(milliseconds: 100));
                File? res =
                    await FilePickerUtils.pickFile(widget.supportedExtensions);
                if (res != null) {
                  String _fileType = lookupMimeType(res.path) ?? "";
                  if (_fileType.contains("image/")) {
                    fileType.value = "image";
                  } else if (_fileType.contains("application/")) {
                    fileType.value = "application";
                    filePreview = const CommonSvgWidget(svgName:"");
                  }
                  file.value = res;
                  if (widget.imageUrl.isNotEmpty) {
                    setState(() {
                      enableFileValidation = true;
                    });
                  }
                  setState(() {});
                  widget.onChange(res);
                }
              },
            )),
            const Expanded(child: SizedBox())
          ],
        ),
        SizedBox(height: 5.h),
        Stack(
          children: [
            if (file.value != null || fileUrl.isNotEmpty)
              ValueListenableBuilder<File?>(
                  valueListenable: file,
                  builder: ((context, fileListenerValue, child) {
                    return Container(
                        height: 100.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: CustomColors.lightGray,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 0.1, color: CustomColors.black)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ValueListenableBuilder<String?>(
                              valueListenable: fileType,
                              builder: ((context, fileTypeListener, child) {
                                if (fileListenerValue != null) {
                                  if (fileTypeListener == "application") {
                                    if (filePreview != null) {
                                      return filePreview!;
                                    } else {
                                      return const SizedBox();
                                    }
                                  } else if (fileTypeListener == "image") {
                                    return Image(
                                      image: FileImage(fileListenerValue),
                                      fit: BoxFit.cover,
                                    );
                                  } else {
                                    return const SizedBox();
                                  }
                                } else if (fileUrl.isNotEmpty) {
                                  return CustomNetWorkImage(
                                    url: fileUrl,
                                    fit: BoxFit.cover,
                                  );
                                }
                                return const SizedBox();
                              })),
                        ));
                  })),
            if (file.value != null || fileUrl.isNotEmpty)
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.white,
                  ),
                  child: InkWell(
                    onTap: () async {
                      file.value = null;
                      fileUrl = "";
                      widget.onChange(null);
                      if (widget.imageUrl.isNotEmpty) {
                        setState(() {
                          enableFileValidation = true;
                        });
                      }
                      setState(() {});
                    },
                    child: Padding(
                      padding: EdgeInsets.all(5.h),
                      child: CommonSvgWidget(
                        svgName:"",
                        width: 12.w,
                        height: 12.h,
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
        SizedBox(
          width: 200.w,
          // height: 15.h,
          child: TextFormField(
            style: const TextStyle(fontSize: 1),
            readOnly: true,
            decoration: const InputDecoration.collapsed(hintText: ""),
            validator: (value) {
              {
                if (!enableFileValidation) {
                  return null;
                } else {
                  return FormValidator.fileValidator(
                      file: file.value,
                      fieldName: "Required Document",
                      errorMessage: "* Required Document",
                      isRequired: widget.isRequired,
                      size: widget.maxFileSize);
                }
              }
            },
          ),
        ),
      ],
    );
  }
}
