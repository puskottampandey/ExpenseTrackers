import 'package:flutter/material.dart';
import 'package:mime/mime.dart';

class MimeTypeUtils {
  static String? checkMimeType(String value) {
    final temp = lookupMimeType(value);
    debugPrint(temp);
    return temp;
  }
}
