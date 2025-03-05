import 'package:expensetracker/core/common_model/multi_language.dart';
import 'package:expensetracker/core/config/local_config.dart';
import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:flutter/material.dart';

class CheckLocal {
  static isEnglish() {
    bool isEnglishLocale = Localizations.localeOf(NavigationService.context) ==
        LocalConfig.english;

    return isEnglishLocale;
  }

  static String check(MultiLanguage value) {
    bool isEnglishLocale = Localizations.localeOf(NavigationService.context) ==
        LocalConfig.english;
    if (isEnglishLocale) {
      return value.en ?? "";
    } else {
      return value.ne ?? "";
    }
  }

  // static String check(MultiLanguage value) {
  //   bool isEnglishLocale = Localizations.localeOf(NavigationService.context) ==
  //       LocalConfig.english;
  //   if (isEnglishLocale) {
  //     return value.en ?? "";
  //   } else {
  //     return value.ne ?? "";
  //   }
  // }

  // static String checkDropDown(CommonDropDownType? value) {
  //   bool isEnglishLocale = Localizations.localeOf(NavigationService.context) ==
  //       LocalConfig.english;
  //   if (isEnglishLocale) {
  //     return value?.en ?? "";
  //   } else {
  //     return value?.ne ?? "";
  //   }
  // }
}
