import 'package:expensetracker/features/settings/presentation/bloc/language_cubit.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:expensetracker/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("language"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Welcome"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<LanguageCubit>().setLocale(context);
                  },
                  child: const Text("language"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: const Text(
                    "Theme",
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
