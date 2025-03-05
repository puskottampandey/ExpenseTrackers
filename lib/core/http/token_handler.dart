import 'dart:io';
import 'package:expensetracker/core/http/cooke_intercerptor.dart';
import 'package:expensetracker/core/storage/local_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  final LocalStorage localStorage;
  final Dio _dio = Dio();
  final String baseUrl;
  final String apiKey;
  final String? userId;

  DioClient({
    required this.baseUrl,
    required this.localStorage,
    required this.apiKey,
    this.userId,
  }) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.headers['x-api-key'] = apiKey
      ..options.connectTimeout = const Duration(seconds: 30)
      ..options.receiveTimeout = const Duration(seconds: 30)
      ..options.responseType = ResponseType.json
      ..interceptors.add(CookieInterceptor(localStorage, _dio, baseUrl, apiKey))
      ..interceptors.add(InterceptorsWrapper(
        onResponse: (res, handler) async {
          return handler.next(res);
        },
        onRequest: (option, handler) async {
          return handler.next(option);
        },
      ));

    if (kDebugMode) {
      _dio.interceptors.add(
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
  }

  Future<Response> get(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.getUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      // if (error is DioError) {
      //   switch (error.response?.statusCode) {
      //     // case 401:
      //     //   return await requestRetrier(
      //     //     baseUrl: baseUrl,
      //     //     response: error.response!,
      //     //     userId: userId,
      //     //   );
      //     default:
      //       rethrow;
      //   }
      // } else {
      //   rethrow;
      // }
      rethrow;
    }
  }

  Future<dynamic> post(
    Uri uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    if (data is Map) {
      payload:
      Map<String, dynamic>.from(data);
    }

    try {
      final response = await _dio.postUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      // if (error is DioException) {
      //   switch (error.response?.statusCode) {
      //     // case 401:
      //     //   return await requestRetrier(
      //     //     baseUrl: baseUrl,
      //     //     response: error.response!,
      //     //     userId: userId,
      //     //   );
      //     default:
      //       rethrow;
      //   }
      // } else {}
      rethrow;
    }
  }

  Future<dynamic> put(
    Uri uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.putUri(
        uri,
        data: data,
        // queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      // if (error is DioError) {
      //   switch (error.response?.statusCode) {
      //     // case 401:
      //     //   return await requestRetrier(
      //     //     baseUrl: baseUrl,
      //     //     response: error.response!,
      //     //     userId: userId,
      //     //   );
      //     default:
      //       rethrow;
      //   }
      // } else {
      // }
      rethrow;
    }
  }

  Future<dynamic> patch(
    Uri uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patchUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      // if (error is DioError) {
      //   switch (error.response?.statusCode) {
      //     // case 401:
      //     //   return await requestRetrier(
      //     //     baseUrl: baseUrl,
      //     //     response: error.response!,
      //     //     userId: userId,
      //     //   );
      //     // default:
      //     //   rethrow;
      //   }
      // } else {
      // }
      rethrow;
    }
  }

  Future<Response> delete(
    Uri uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.deleteUri(uri,
          // queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          data: data);
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (error) {
      // if (error is DioError) {
      //   switch (error.response?.statusCode) {
      //     // case 401:
      //     //   return await requestRetrier(
      //     //     baseUrl: baseUrl,
      //     //     response: error.response!,
      //     //     userId: userId,
      //     //   );
      //     // default:
      //     //   rethrow;
      //   }
      // } else {
      // }
      rethrow;
    }
  }
}
