import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HiveStorage {
  // hive storage

  final userresource = "user_resource";

  final phoneData = "remember_me";
  final language = "language";
  final deviceConfig = "deviceConfig";
  final appVersion = "appVersion";

  final dynamicBaseUrl = "";
  final address = "address";
  final billingAddress = "billingAddress";

  String onboard = "onboard";
  String badge = "badge";

  Future<void> setData(String key, String value);
  Future<String?> getData(String key);
  Future<void> removeData(String key);

  Future<void> setDataByIntegerType(String key, int value);
  Future<int?> getDataInt(String key);
}

class HiveStorageImpl extends HiveStorage {
  @override
  Future<void> setData(String key, String value) async {
    final box = await Hive.openBox(userresource);
    await box.put(key, value);
  }

  @override
  Future<String?> getData(String key) async {
    try {
      final box = await Hive.openBox(userresource);
      final data = box.get(key);
      if (data != null) {
        return data;
      }

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Future<void> removeData(String key) async {
    final box = await Hive.openBox(userresource);
    await box.delete(key);
    await box.close();
  }

  @override
  Future<void> setDataByIntegerType(String key, int value) async {
    final box = await Hive.openBox(userresource);
    await box.put(key, value);
  }

  @override
  Future<int?> getDataInt(String key) async {
    try {
      final box = await Hive.openBox(userresource);
      final data = box.get(key);
      if (data != null) {
        return data;
      }

      return data;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}