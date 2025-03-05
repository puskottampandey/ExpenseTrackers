import 'package:expensetracker/core/config/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  final Env env;
  const MultiRepositoryWrapper(
      {super.key, required this.child, required this.env});
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Env>(
          create: (context) => env,
          lazy: true,
        ),
      ],
      child: child,
    );
  }
}
