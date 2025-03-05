import 'dart:io';
import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/utils/custom_toast.dart';
import 'package:expensetracker/core/utils/log.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:upgrader/upgrader.dart';

class UpdateWrapper extends StatefulWidget {
  final Widget child;

  const UpdateWrapper({
    super.key,
    required this.child,
  });

  @override
  State<UpdateWrapper> createState() => _UpdateWrapperState();
}

class _UpdateWrapperState extends State<UpdateWrapper> {
  Future<void> _checkInApp(BuildContext context) async {
    try {
      if (Platform.isAndroid && !kDebugMode) {
        InAppUpdate.checkForUpdate().then((value) async {
          if (value.immediateUpdateAllowed) {
            final AppUpdateResult result =
                await InAppUpdate.performImmediateUpdate();
            if (context.mounted) {
              if (result == AppUpdateResult.inAppUpdateFailed) {
                CustomToast.error(message: "Update Failed");
              } else if (result == AppUpdateResult.success) {
                CustomToast.error(message: "Update Success");
              }
            }
          }
        });
      }
    } catch (e) {
      Log.e(e);
    }
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500)).whenComplete(() {
      _checkInApp(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class IosUpdateWrapper extends StatefulWidget {
  final Widget child;
  const IosUpdateWrapper({super.key, required this.child});

  @override
  State<IosUpdateWrapper> createState() => _IosUpdateWrapperState();
}

class _IosUpdateWrapperState extends State<IosUpdateWrapper> {
  @override
  Widget build(BuildContext context) {
    return (Platform.isIOS && !kDebugMode)
        ? UpgradeAlert(
            dialogStyle: UpgradeDialogStyle.cupertino,
            upgrader: Upgrader(),
            navigatorKey: NavigationService.navigationKey,
            onUpdate: () {
              return true;
            },
            child: widget.child,
          )
        : widget.child;
  }
}
