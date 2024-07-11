import 'package:expensetracker/global/connection_check/connection_controller.dart';
import 'package:expensetracker/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return NetworkListener(
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: router,
            );
          }),
    );
  }
}

class NetworkListener extends ConsumerWidget {
  final Widget child;

  const NetworkListener({required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(networkControllerProvider);
    return child;
  }
}
