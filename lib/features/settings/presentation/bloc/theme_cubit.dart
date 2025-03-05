import 'package:expensetracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppThemes.lightTheme);

  void toggleTheme() {
    if (state == AppThemes.lightTheme) {
      emit(AppThemes.darkTheme);
    } else {
      emit(AppThemes.lightTheme);
    }
  }

  void setTheme(ThemeData themeData) {
    emit(themeData);
  }
}
