import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/features/settings/presentation/bloc/language_cubit.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocWrapper extends StatelessWidget {
  final Widget child;
  final Env env;

  const MultiBlocWrapper({super.key, required this.child, required this.env});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),        
      ],
      child: child,
    );
  }
}
