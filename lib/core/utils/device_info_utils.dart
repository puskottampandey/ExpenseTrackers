import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoUtils {
  static final DeviceInfoUtils _deviceUtils = DeviceInfoUtils._internal();

  factory DeviceInfoUtils() {
    return _deviceUtils;
  }

  DeviceInfoUtils._internal();
  static DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static String _deviceId = "";

  static String _marketingName = "";

  static String _userAgent = "";

  static String _appVersion = "";

  static Future<int?> getSdkVersion() async {
    final info = await _deviceInfo.androidInfo;
    return info.version.sdkInt;
  }

  static Future<String> getDeviceName() async {
    String deviceName = 'Unknown';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        deviceName = androidInfo.model;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        deviceName = iosInfo.name;
      }
    } catch (e) {
      debugPrint("Error getting device name: $e");
    }

    return deviceName;
  }

  static Future<String> get getAppVersion async {
    if (_appVersion.isNotEmpty) {
      return _appVersion;
    } else {
      final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
      _appVersion = _packageInfo.version;
      return _appVersion;
    }
  }

  static Future<String> get getPackageName async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    return _packageInfo.packageName;
  }

  static Future<String> getDeviceId() async {
    try {
      var deviceInfo = DeviceInfoPlugin();
      if (Platform.isIOS) {
        var iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor ?? "";
      } else if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfo.androidInfo;
        return androidDeviceInfo.id;
      } else {
        return "";
      }
    } catch (e) {
      debugPrint(e.toString());

      return "";
    }
  }

  static Future<String> get getAppName async {
    final PackageInfo _packageInfo = await PackageInfo.fromPlatform();
    return _packageInfo.appName;
  }
}
