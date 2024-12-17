import 'package:dio/dio.dart';
import 'package:tracking_stocks/core/error/dio_extension.dart';

import '../utils/app_logger.dart';
import 'dart:io';

import 'app_exceptions.dart';

typedef ExceptionHandler<T> = Future<T> Function();

Future<T> handleExceptions<T>(ExceptionHandler<T> handler) async {
  try {
    return await handler();
  } on SocketException catch (e, stackTrace) {
    AppLogger.logError('Network error occurred', e, stackTrace);
    throw NetworkException();
  } on DioException catch (e, stackTrace) {
    AppLogger.logError('API error occurred', e, stackTrace);
    throw e.toAppException();
  } catch (e, stackTrace) {
    AppLogger.logError('Unexpected error occurred', e, stackTrace);
    throw NetworkException();
  }
}
