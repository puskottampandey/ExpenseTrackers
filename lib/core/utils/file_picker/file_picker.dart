import 'dart:io';

import 'package:expensetracker/core/utils/permission_handler_utils.dart';
import 'package:file_picker/file_picker.dart';


class FilePickerUtils {
  static Future<File?> pickFile(List<String> supportedExtensions) async {
    FilePickerResult? result;
    await PermissionHandlerUtils.storagePsermissonHandler();
    // await PermissionHandlerUtils.photoPermission();

    // await PermissionHandlerUtils.externalStoragePermission();
    // await PermissionHandlerUtils.documentPermission();
    result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: supportedExtensions,
    );
    return result != null ? File(result.files.single.path!) : null;
  }
}
