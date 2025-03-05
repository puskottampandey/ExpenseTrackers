import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

class FileTypeUtils {
  static checkFileType(File file) {
    debugPrint(lookupMimeType(file.path));
  }
}

