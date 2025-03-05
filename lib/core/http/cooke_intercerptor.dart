import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:expensetracker/core/constants/common_enum.dart';
import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/storage/local_storage.dart';
import 'package:expensetracker/core/utils/custom_toast.dart';
import 'package:expensetracker/core/utils/log.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CookieInterceptor extends Interceptor {
  final LocalStorage localStorage;
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  CookieInterceptor(
    this.localStorage,
    this.dio,
    this.baseUrl,
    this.apiKey,
  );

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final cookie = await _getCookies();

      options.headers['Cookie'] = cookie;

      super.onRequest(options, handler);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onResponse(response, handler) async {
    try {
      final cookies = response.headers['set-cookie'];
      if (cookies != null && cookies.isNotEmpty) {
        String parsedCookie = "";
        try {
          parsedCookie = jsonEncode(cookies);
        } catch (e) {
          debugPrint(e.toString());
        }
        await localStorage.setSecureData(localStorage.cookie, parsedCookie);
      }

      super.onResponse(response, handler);
    } catch (e) {
      rethrow;
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401 &&
        err.response?.data['message'] == ErrorMessage.TOKEN_EXPIRED.name) {
      Log.e(err);
      final cookieList = await _getCookies();
      if (cookieList.isNotEmpty) {
        final success = await _refreshToken(handler);

        if (success) {
          final options = err.requestOptions;
          options.headers['Cookie'] =
              await localStorage.getSecureData(localStorage.cookie);

          try {
            final response = await dio.fetch(options);
            return handler.resolve(response);
          } catch (e) {
            return handler.next(e as DioException);
          }
        }
      }
      handler.next(err);
    } else if (err.response?.statusCode == 401) {
      await localStorage.removeSecureData(localStorage.cookie);
      await localStorage.removeSecureData(localStorage.userRole);
      await localStorage.removeSecureData(localStorage.userId);
      CustomToast.error(message: "Session Expired");
      // Future.sync(() {
      //   NavigationService.context.go();
      // });
      handler.next(err);
    }

    handler.next(err);
  }

  Future<bool> _refreshToken(ErrorInterceptorHandler handler) async {
    try {
      final cookie = await _getCookies();

      Dio _temp = Dio();

      final refreshToken = _getRefreshToken(cookie);

      final Map<String, dynamic> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        'x-api-key': apiKey,
        'Cookie': refreshToken,
      };

      _temp
        ..options.baseUrl = baseUrl
        ..options.headers = header
        ..options.connectTimeout = const Duration(seconds: 30)
        ..options.receiveTimeout = const Duration(seconds: 30)
        ..options.responseType = ResponseType.json;

      if (kDebugMode) {
        _temp.interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseHeader: true,
            responseBody: true,
            error: true,
            compact: true,
          ),
        );
      }

      final response = await _temp
          .postUri(Uri.parse('$baseUrl/auth/refresh-token'), data: {});

      if (response.statusCode == 200) {
        final cookies = response.headers['set-cookie'];
        if (cookies != null && cookies.isNotEmpty) {
          String parsedCookie = "";
          try {
            parsedCookie = jsonEncode(cookies);
          } catch (e) {
            debugPrint(e.toString());
          }
          await localStorage.setSecureData(localStorage.cookie, parsedCookie);
        }

        return true;
      } else if (response.statusCode == 401) {
        Log.e(response.statusMessage);
        await localStorage.removeSecureData(localStorage.cookie);
        await localStorage.removeSecureData(localStorage.userData);
        return false;
      } else {
        return false;
      }
    } on DioException catch (e, s) {
      debugPrint(e.message);

      debugPrint(e.response.toString());
      return false;
    } catch (e) {
      debugPrint("Token refresh failed: $e");
      return false;
    }
  }

  _getRefreshToken(List<String> cookie) {
    try {
      return cookie.firstWhere((v) => v.contains("refreshToken"));
    } catch (e) {
      Log.e(e);
      return "";
    }
  }

  Future<List<String>> _getCookies() async {
    final cookie = await localStorage.getSecureData(localStorage.cookie);
    List<String> cookieList = [];
    try {
      cookieList = List<String>.from(jsonDecode(cookie ?? ""));
    } catch (e) {
      debugPrint(e.toString());
    }
    return cookieList;
  }
}
