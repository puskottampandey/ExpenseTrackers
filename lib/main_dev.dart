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

    WidgetsFlutterBinding.ensureInitialized();

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
