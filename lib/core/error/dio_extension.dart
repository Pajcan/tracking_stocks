import 'package:dio/dio.dart';

import 'app_exceptions.dart';

extension DioExceptionExtension on DioException {
  AppException toAppException() {
    if (response == null) {
      throw NetworkException();
    }
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 403:
        throw ForbiddenException();
      case 404:
        throw NotFoundException();
      case 500:
        throw ServerException();
      default:
        throw NetworkException();
    }
  }
}
