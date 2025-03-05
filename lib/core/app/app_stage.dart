import 'package:expensetracker/core/config/env.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final Env env;
  // final ReceivedAction? receivedAction;

  const App({
    super.key,
    required this.env,
  });

  @override
  Widget build(BuildContext context) {
    return

        //  MultiRepositoryWrapper(
        //   env: env,
        //   child: MultiBlocWrapper(
        //     env: env,
        //     child: UpdateWrapper(
        //       child: NotificationWrapper(
        //         context: context,
        //         child:

        const MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: context.locale,
      // navigatorKey: NavigationService.navigationKey,
      // localizationsDelegates: [
      //   ...context.localizationDelegates,
      // ],
      // supportedLocales: context.supportedLocales,
      // theme: CustomTheme.lightTheme,
      // title: env.environment.appTitle,
      // initialRoute: Routes.root,
      // onGenerateRoute: (settings) {
      //   if (settings.name == Routes.root) {
      //     return RouteGenerator.generateRoute(
      //       RouteSettings(
      //         name: settings.name,
      //         arguments: receivedAction,
      //       ),
      //     );
      //   }
      //   return RouteGenerator.generateRoute(settings);
      // },
      // ),
      //     ),
      //   ),
      // ),
    );
  }
}
