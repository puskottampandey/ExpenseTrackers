import 'package:flutter/material.dart';

class LocalConfig {
  static const english = Locale("en", "US");
  static const nepali = Locale("ne", "ne_NP");

  static Locale fallBackLocal = nepali;

  // static getFallBackLocal() async {
  //   final lang = await AuthHive().getLanguage();
  //   if (lang == "en") {
  //     fallBackLocal = english;
  //   } else {
  //     fallBackLocal = nepali;
  //   }
  // }
}
