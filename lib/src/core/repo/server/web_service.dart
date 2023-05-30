import 'package:dio/dio.dart';
import 'package:flutter_starter/src/core/config/my_env.dart';
import 'package:flutter_starter/src/core/repo/server/interceptors/error_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'interceptors/auth_interceptor.dart';

part 'web_service.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var request = BaseOptions(
    baseUrl: Environment.baseUrl,
  );

  var dio = Dio(request);

  // handle auth related error
  dio.interceptors.addAll(
    [
      NetworkErrorInterceptor(ref),
      AuthInterceptor(ref),
    ],
  );

  if (!Environment.isProduction) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  return dio;
}
