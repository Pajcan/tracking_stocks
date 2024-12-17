import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../config/config.dart';

@singleton
class DioService {
  final Dio dio;

  DioService(IConfig config)
      : dio = Dio(BaseOptions(
    baseUrl: config.baseUrl,
    headers: config.headers,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  )) {
    _setupInterceptors(dio);
  }

  void _setupInterceptors(Dio dio) {
    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
  }
}
