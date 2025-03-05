import 'package:flutter/material.dart';
import 'package:path/path.dart';

class FileBasenameUtils {
  static getFileBaseName(String filePath) {
    try {
      return basename(filePath);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
