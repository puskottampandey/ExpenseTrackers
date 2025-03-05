class CustomException implements Exception {
  CustomException([this._message, this._prefix, this.statusCode]);

  final dynamic _message;
  final dynamic _prefix;
  final int? statusCode;

  dynamic get message => _message;
  @override
  String toString() {
    return "${_prefix ?? ""}$_message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message, int? statusCode])
      : super(message, "error during communication: ", statusCode);
}

class NoInternetException extends CustomException {
  NoInternetException([String? message, int? statusCode])
      : super(message, "no internet connection", statusCode);
}

class BadRequestException extends CustomException {
  BadRequestException([String? message, int? statusCode])
      : super(message, "invalid request", statusCode);
}

class ResourceNotFoundException extends CustomException {
  ResourceNotFoundException([String? message, int? statusCode])
      : super(
            message,
            (message == null || message == "") ? "resource not found" : "",
            statusCode);
}

class UnAuthorizedException extends CustomException {
  UnAuthorizedException([String? message, int? statusCode])
      : super(message, "UnAuthorized", statusCode);
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message, int? statusCode])
      : super(message, "invalid input", statusCode);
}

class InternalServerErrorException extends CustomException {
  InternalServerErrorException([String? message, int? statusCode])
      : super(message, "internal server error", statusCode);
}

class CacheException extends CustomException {
  CacheException([String? message, int? statusCode])
      : super(message, "cache error", statusCode);
}
