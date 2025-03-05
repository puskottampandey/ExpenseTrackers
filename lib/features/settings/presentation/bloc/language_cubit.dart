import 'package:expensetracker/core/config/local_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(LocalConfig.english);

  setLocale(context) {
    final locale = Localizations.localeOf(context);

    if (locale == LocalConfig.english) {
      emit(LocalConfig.nepali);
    } else {
      emit(LocalConfig.english);
    }
  }
}
