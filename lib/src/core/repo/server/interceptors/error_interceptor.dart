import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_starter/src/core/repo/server/network_config.dart';
import 'package:flutter_starter/src/ui/app/provider/app/app_state.dart';
import 'package:loggy/loggy.dart';

import '../../../../ui/app/provider/app/app_provider.dart';
import '../exceptions/base_exception_mixins.dart';
import '../exceptions/network_exception.dart';
import '../exceptions/token_exception.dart';
import '../web_service.dart';

class NetworkErrorInterceptor extends QueuedInterceptor with NetworkLoggy {
  final DioRef ref;

  NetworkErrorInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // check is network available
    if (!await NetworkConfig.isNetworkAvailable()) {
      notifyApp(
        NetworkException(
          message: "No internet connection",
          action: ExceptionAction.retry,
          exception: DioError(
            requestOptions: options,
            type: DioErrorType.connectionError,
          ),
        ),
        "No internet connection",
      );
      return handler.reject(
        DioError(
          requestOptions: options,
          type: DioErrorType.connectionError,
          error: NetworkException(
            message: "No internet connection",
            action: ExceptionAction.retry,
          ),
        ),
      );
    }

    // lets execute the next interceptor
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // if error type is 403 or 401
      // then move forward to the next interceptor
      // and let the auth interceptor handle it
      return handler.next(err);
    }

    var exception = NetworkException(
      exception: err,
    );

    // check network error
    if (err is SocketException) {
      exception = exception.copyWith(
        message: "No internet connection",
        action: ExceptionAction.retry,
      );
      err = err.copyWith(
        type: DioErrorType.connectionError,
        error: exception,
      );
      notifyApp(
        exception,
        exception.message,
      );

      return handler.next(err);
    }

    loggy.info(err.message);

    // now handle dio error
    exception = detectDioError(err);

    notifyApp(
      exception,
      exception.message,
    );

    return handler.next(err);
  }

  String detectStatusError(DioError err) {
    var message =
        err.response != null ? err.response?.statusMessage : err.message;

    switch (err.response?.statusCode) {
      case 500:
        message ??= "Server offline";
        break;
      case 404:
        message ??= "Resources not found";
        break;
      case 400:
        message ??= "Bad request";
        break;
    }

    return message ?? "Unknown error";
  }

  NetworkException detectDioError(DioError err) {
    var message =
        err.response != null ? err.response?.statusMessage : err.message;

    switch (err.type) {
      case DioErrorType.cancel:
        message ??= "Request to API server was cancelled";
        break;
      case DioErrorType.connectionTimeout:
        message ??= "Connection timeout with API server";
        break;
      case DioErrorType.unknown:
        message ??= "Connection to API server failed due to unknown exception";
        break;
      case DioErrorType.receiveTimeout:
        message ??= "Receive timeout in connection with API server";
        break;
      case DioErrorType.sendTimeout:
        message ??= "Send timeout in connection with API server";
        break;
      case DioErrorType.badCertificate:
        message ??= "Bad Certificate Error";
        break;
      case DioErrorType.connectionError:
        message ??= "Connection Error";
        break;
      case DioErrorType.badResponse:
        // only trigger for 400 and 500
        message = detectStatusError(err);
        break;
    }

    return NetworkException(
      exception: err,
      message: message,
    );
  }

  void notifyApp(Exception exception, dynamic message, {dynamic extra}) {
    var data = ref.read(appStateNotifierProvider.notifier);
    var state = ref.read(appStateNotifierProvider).copyWith(
          exception: TokenException(
            exception: exception,
            action: ExceptionAction.nothing,
            message: message,
            extra: extra,
          ),
        );
    loggy.debug("Notify app with exception: $exception");
    data.onEvent(state, AppStateEvent.exception);

    loggy.error(message, exception);
  }
}
