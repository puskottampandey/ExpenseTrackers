import 'dart:async';
import 'package:expensetracker/core/app/app_dev.dart';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/service_locator.dart' as sl;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/utils/log.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await sl.init(EnvValue.development);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]).then(
      (_) {
        runApp(
          App(
            env: EnvValue.development,
          ),
        );
      },
    );
  }, (e, s) {
    Log.e(e);
    Log.d(s);
  });
}

// import 'package:expensetracker/global/connection_check/connection_controller.dart';
// import 'package:expensetracker/routes/router.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

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
