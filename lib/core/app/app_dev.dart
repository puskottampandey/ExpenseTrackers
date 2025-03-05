import 'package:expensetracker/core/app/notification_wrapper.dart';
import 'package:expensetracker/core/app/update_wrapper.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/config/local_config.dart';
import 'package:expensetracker/core/wrapper/multi_bloc_wrapper.dart';
import 'package:expensetracker/core/wrapper/multi_repository_wrapper.dart';
import 'package:expensetracker/features/settings/presentation/bloc/language_cubit.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:expensetracker/generated/l10n.dart';
import 'package:expensetracker/routes/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  final Env env;

  const App({
    super.key,
    required this.env,
  });

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryWrapper(
      env: widget.env,
      child: MultiBlocWrapper(
        env: widget.env,
        child: NotificationWrapper(
          context: context,
          child: UpdateWrapper(
            child: BlocBuilder<ThemeCubit, ThemeData>(
              builder: (context, theme) {
                return BlocBuilder<LanguageCubit, Locale>(
                  builder: (context, state) {
                    return ScreenUtilInit(
                      designSize: const Size(360, 690),
                      minTextAdapt: true,
                      splitScreenMode: false,
                      builder: (context, child) {
                        return MaterialApp.router(
                          debugShowCheckedModeBanner: false,
                          routerConfig: router,
                          supportedLocales: const [
                            LocalConfig.english,
                            LocalConfig.nepali,
                          ],
                          locale: state,
                          theme: theme,
                          localizationsDelegates: const [
                            S.delegate,
                            // GlobalMaterialLocalizations.delegate,
                            // GlobalWidgetsLocalizations.delegate,
                            // GlobalCupertinoLocalizations.delegate,
                          ],
                          localeResolutionCallback: (locale, supportedLocales) {
                            for (var supportedLocale in supportedLocales) {
                              if (supportedLocale.languageCode ==
                                  locale?.languageCode) {
                                return supportedLocale;
                              }
                            }
                            return supportedLocales.first;
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
// void main() {
//   runApp(
//     const ProviderScope(
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.watch(networkControllerProvider);
//     return ScreenUtilInit(
//         designSize: const Size(360, 690),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (_, child) {
//           return MaterialApp.router(
//             debugShowCheckedModeBanner: false,
//             routerConfig: router,
//           );
//         });
//   }
// }
