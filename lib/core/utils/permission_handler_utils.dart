import 'dart:io';
import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/utils/device_info_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widget/dialog/permission_alert_dialog.dart';

class PermissionHandlerUtils {
  // static Future<bool> locationPermissionHandler() async {
  //   if (await Permission.location.isGranted) {
  //     return true;
  //   } else {
  //     return await showLocationPermissionDialog().then((value) async {
  //       if (value != null && value) {
  //         await Permission.location.request();

  //         if (await Permission.location.isDenied) {
  //           permissionAlertDialog(
  //               subtitle: 'Location permission required',
  //               title:
  //                   'The app needs location permission to function properly');
  //           return false;
  //         } else if (await Permission.location.isPermanentlyDenied) {
  //           permissionAlertDialog(
  //               subtitle: 'Location permission required',
  //               title:
  //                   'The app needs location permission to function properly');
  //           return false;
  //         } else {
  //           return true;
  //         }
  //       } else {
  //         return false;
  //       }
  //     });
  //   }
  // }

  static Future<bool> storagePsermissonHandler() async {
    final value = await Permission.accessMediaLocation.request();

    if (Platform.isAndroid) {
      final sdk = await DeviceInfoUtils.getSdkVersion();

      if (sdk != null && sdk > 32) {
        if (await Permission.mediaLibrary.isGranted) {
          return true;
        } else {
          await Permission.mediaLibrary.request();
          if (await Permission.mediaLibrary.isDenied) {
            permissionAlertDialog(
                subtitle: 'Storage permission required',
                title: 'The app needs storage permission to function properly');
            return false;
          } else if (await Permission.storage.isPermanentlyDenied) {
            permissionAlertDialog(
                subtitle: 'Storage permission required',
                title: 'The app needs storage permission to function properly');
            return false;
          } else {
            return false;
          }
        }
      } else if (await Permission.storage.isGranted) {
        return true;
      } else {
        await Permission.storage.request();

        if (await Permission.storage.isDenied) {
          permissionAlertDialog(
              subtitle: 'Storage permission required',
              title: 'The app needs storage permission to function properly');
          return false;
        } else if (await Permission.storage.isPermanentlyDenied) {
          permissionAlertDialog(
              subtitle: 'Storage permission required',
              title: 'The app needs storage permission to function properly');
          return false;
        } else {
          return false;
        }
      }
    } else if (Platform.isIOS) {
      if (await Permission.storage.isGranted) {
        return true;
      } else {
        await Permission.storage.request();

        if (await Permission.storage.isDenied) {
          permissionAlertDialog(
              subtitle: 'Storage permission required',
              title: 'The app needs storage permission to function properly');
          return false;
        } else if (await Permission.storage.isPermanentlyDenied) {
          permissionAlertDialog(
              subtitle: 'Storage permission required',
              title: 'The app needs storage permission to function properly');
          return false;
        } else {
          return false;
        }
      }
    } else {
      return false;
    }
  }

  // static Future<bool> photoPermission() async {
  //   if (await Permission.photos.isGranted) {
  //     return true;
  //   } else {
  //     await Permission.photos.request();
  //     // await Permission.videos.request();
  //     // await Permission.audio.request();

  //     if (await Permission.photos.isDenied) {
  //       permissionAlertDialog(
  //           subtitle: 'Storage permission required',
  //           title: 'The app needs storage permission to function properly');
  //       return false;
  //     } else if (await Permission.photos.isPermanentlyDenied) {
  //       permissionAlertDialog(
  //           subtitle: 'Storage permission required',
  //           title: 'The app needs storage permission to function properly');
  //       return false;
  //     } else {
  //       return false;
  //     }
  //   }
  // }

  // static Future<bool> documentPermission() async {
  //   await Permission.photosAddOnly.request();
  //   return true;
  //   // if (await Permission.mediaLibrary.isGranted) {
  //   //   return true;
  //   // } else {
  //   //   await Permission.photos.request();

  //   //   if (await Permission.photos.isDenied) {
  //   //     permissionAlertDialog(
  //   //         subtitle: 'Storage permission required',
  //   //         title: 'The app needs storage permission to function properly');
  //   //     return false;
  //   //   } else if (await Permission.photos.isPermanentlyDenied) {
  //   //     permissionAlertDialog(
  //   //         subtitle: 'Storage permission required',
  //   //         title: 'The app needs storage permission to function properly');
  //   //     return false;
  //   //   } else {
  //   //     return false;
  //   //   }
  //   // }
  // }

  // static Future<void> externalStoragePermission() async {
  //   final status = await Permission.storage.status;
  //   await Permission.manageExternalStorage.request();
  //   if (status != PermissionStatus.granted) {
  //     await Permission.storage.request();
  //   }
  //   if (await Permission.manageExternalStorage.isDenied) {
  //     await Permission.manageExternalStorage.request();
  //   }
  // }

  static Future<bool> cameraPermission() async {
    if (await Permission.camera.isGranted) {
      return true;
    } else {
      await Permission.camera.request();
      if (await Permission.camera.isDenied) {
        permissionAlertDialog(
            subtitle: 'Camera permission required',
            title: 'The app needs camera permission to function properly');
        return false;
      } else if (await Permission.camera.isPermanentlyDenied) {
        permissionAlertDialog(
            subtitle: 'Camera permission required',
            title: 'The app needs camera permission to function properly');
        return false;
      } else {
        return false;
      }
    }
  }

  static notificationPermission() async {
    await FirebaseMessaging.instance.requestPermission().then((value) {
      final isAllowed =
          value.authorizationStatus == AuthorizationStatus.authorized;

      if (!isAllowed) {
        showDialog(
          context: NavigationService.context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
              TextButton(
                onPressed: () => FirebaseMessaging.instance
                    .requestPermission()
                    .then((_) => Navigator.pop(context)),
                child: Text(
                  'Allow',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
