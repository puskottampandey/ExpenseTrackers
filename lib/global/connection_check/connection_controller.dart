import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expensetracker/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final networkControllerProvider =
    StateNotifierProvider<NetworkController, bool>((ref) {
  return NetworkController();
});

class NetworkController extends StateNotifier<bool> {
  final Connectivity _connectivity = Connectivity();

  NetworkController() : super(false) {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      if (!state) {
        state = true;
        navigatorKey.currentState!.context.push("/connectionscreen");
      }
    } else {
      if (state) {
        Navigator.pop(navigatorKey.currentState!.context);
        state = false;
      }
    }
  }
}
