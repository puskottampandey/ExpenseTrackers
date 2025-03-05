import 'dart:async';
import 'package:expensetracker/core/config/env.dart';
import 'package:expensetracker/core/error/exceptions.dart';
import 'package:expensetracker/core/http/token_handler.dart';

import 'package:dio/dio.dart';
import 'package:expensetracker/core/storage/local_storage.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Env env;
  LocalStorage localStorage;

  ApiProvider({
    required this.env,
    required this.localStorage,
  });
  String accessToken = "";
  String refreshToken = "";

  Future<Map<String, dynamic>> post(
    String url,
    dynamic body, {
    String? userId,
    String token = '',
    bool isRefreshRequest = false,
    Map<String, String> header = const {},
  }) async {
    dynamic responseJson;
    final DioClient dioClient = DioClient(
      baseUrl: env.baseUrl,
      userId: userId,
      apiKey: env.apiKey,
      localStorage: localStorage,
    );

    try {
      final Map<String, dynamic> requestHeader = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
        ...header,
      };
      final dynamic response = await dioClient.post(
        Uri.parse(url),
        data: body,
        options: Options(headers: requestHeader),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      debugPrint(e.toString());
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> patch(
    String url,
    dynamic body, {
    String? userId,
    String token = '',
    bool isRefreshRequest = false,
    bool hasSecretKey = true,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: env.baseUrl,
      userId: userId,
      apiKey: env.apiKey,
      localStorage: localStorage,
    );

    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };
      final dynamic response = await dioClient.patch(
        Uri.parse(url),
        data: body,
        options: Options(headers: header),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> put(
    String url,
    dynamic body, {
    required String? userId,
    String token = '',
    bool hasSecretKey = true,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: env.baseUrl,
      userId: userId,
      apiKey: env.apiKey,
      localStorage: localStorage,
    );

    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };

      // if (hasSecretKey) header['x-api-key'] = env.apiKey;

      final dynamic response = await dioClient.put(
        Uri.parse(url),
        data: body,
        options: Options(headers: header),
      );
      responseJson = _response(response, url);
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  Future<dynamic> get(
    Uri url, {
    String? userId,
    String token = '',
    int timeOut = 30,
    bool hasSecretKey = true,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: env.baseUrl,
      userId: userId,
      apiKey: env.apiKey,
      localStorage: localStorage,
    );

    dynamic responseJson;

    try {
      final Map<String, dynamic> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };
      final dynamic response = await dioClient.get(
        url,
        options: Options(
          headers: header,
        ),
      );

      responseJson = _response(response, url.toString(), cacheResult: true);
    } on DioException catch (e, s) {
      responseJson = await _handleErrorResponse(e);
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    return responseJson;
  }

  Future<dynamic> delete(
    Uri url, {
    String token = '',
    dynamic body,
    bool hasSecretKey = true,
  }) async {
    final DioClient dioClient = DioClient(
      baseUrl: env.baseUrl,
      localStorage: localStorage,
      apiKey: env.apiKey,
    );
    dynamic responseJson;
    try {
      final Map<String, String> header = {
        'content-type': 'application/json',
        'accept': 'application/json',
        'origin': '*',
      };
      final dynamic response = await dioClient.delete(url,
          data: body, options: Options(headers: header));
      responseJson = await _response(response, url.toString());
      responseJson['status'] = response.statusCode;
    } on DioException catch (e) {
      responseJson = await _handleErrorResponse(e);
    }
    return responseJson;
  }

  _handleErrorResponse(DioException e) async {
    if (e.toString().toLowerCase().contains("socketexception")) {
      throw NoInternetException("No internet connection", 1000);
    } else {
      if (e.response != null) {
        return await _response(e.response!, "");
      } else {
        throw FetchDataException(
          "errorOccuredWhileFetchingData",
          e.response?.statusCode,
        );
      }
    }
  }

  Future<Map<String, dynamic>> _response(Response response, String url,
      {bool cacheResult = false}) async {
    final Map<String, dynamic> res = response.data is Map
        ? response.data
        : (response.data is List)
            ? {"data": response.data}
            : {};

    final responseJson = <String, dynamic>{};
    responseJson['data'] = res;

    responseJson['statusCode'] = response.statusCode;
    switch (response.statusCode) {
      case 200:
      case 202:
      case 204:
      case 201:
        return responseJson;
      case 400:
        throw BadRequestException(
            getErrorMessage(res, 400), response.statusCode);
      case 404:
        throw ResourceNotFoundException(
            getErrorMessage(res, 404), response.statusCode);

      case 409:
        throw BadRequestException(
            getErrorMessage(res, 40), response.statusCode);
      case 422:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            getErrorMessage(res, 404), response.statusCode);
      case 429:
        responseJson['error'] = getErrorMessage(res, response.statusCode);
        throw BadRequestException(
            "To many Request Try again", response.statusCode);
      case 401:
      case 403:
        throw UnAuthorizedException(
            getErrorMessage(res, 404), response.statusCode);
      case 500:
        throw InternalServerErrorException(
            getErrorMessage(res, 404), response.statusCode);

      default:
        throw NoInternetException("No Internet Exception", 1000);
    }
  }

  String getErrorMessage(dynamic res, [int? statusCode]) {
    String message = "";
    try {
      debugPrint(res.toString());
      debugPrint("-------------------GET ERROR ------------------");

      if (res["data"] is Map) {
        if (res["data"]?["message"] is String &&
            (res["data"]?["message"] ?? "").toString().isNotEmpty) {
          message = res["data"]?["message"];
          return message;
        }
      }
      if (res["message"] is String) {
        message = res["message"];
        return message;
      }
      if (res["message"] is List) {
        final List<dynamic> messages = res['message'][0]["messages"];
        for (var element in messages) {
          message += (element as Map<String, dynamic>)['message'] + '\n';
        }
        return message;
      }
      if (res["data"] is String) {
        return message = res["data"] ?? "";
      }
    } catch (e) {
      return message.isEmpty
          ? _getErroMessageAccordingtoStatusCode(statusCode)
          : message;
    }
    return message.isEmpty
        ? _getErroMessageAccordingtoStatusCode(statusCode)
        : message;
  }

  // retrun _messageStringHandler(String message) {
  //   if (message.isEmpty) {
  //     return "something went wrong";
  //   }
  // }

  String _getErroMessageAccordingtoStatusCode(int? statusCode) {
    if (statusCode == 400) {
      return "badRequest";
    } else if (statusCode == 404) {
      return "resourceNotFound";
    } else if (statusCode == 422) {
      return "badRequest";
    } else if (statusCode == 403 || statusCode == 402 || statusCode == 401) {
      return "unAuthorised";
    } else if (statusCode == 500) {
      return "internalServerError";
    } else {
      return "someThingWentWrong";
    }
  }

  tokenHandler() {}
}
