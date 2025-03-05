import 'dart:io';
import 'package:expensetracker/core/storage/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends LocalStorage {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage(
    aOptions: Platform.isAndroid
        ? const AndroidOptions(
            encryptedSharedPreferences: true,
          )
        : AndroidOptions.defaultOptions,
  );

  @override
  Future<void> setSecureData(
    String key,
    String value,
  ) async {
    try {
      await _flutterSecureStorage.write(key: key, value: value);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<String?> getSecureData(String key) async {
    try {
      return await _flutterSecureStorage.read(key: key);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  @override
  Future<void> removeSecureData(String key) async {
    await _flutterSecureStorage.delete(key: key);
    //await box.close();
  }

  // @override
  // dynamic noSuchMethod(Invocation invocation) {
  //   try {
  //     debugPrint('Method ${invocation.memberName} is not implemented');
  //     return super.noSuchMethod(invocation);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }
}
