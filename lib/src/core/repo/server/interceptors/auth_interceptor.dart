import 'package:dio/dio.dart';
import 'package:flutter_starter/src/core/config/my_env.dart';
import 'package:flutter_starter/src/core/repo/server/auth_token.dart';
import 'package:flutter_starter/src/core/repo/server/network_config.dart';
import 'package:flutter_starter/src/ui/app/provider/app/app_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loggy/loggy.dart';
import '../../../../ui/app/provider/app/app_provider.dart';
import '../exceptions/base_exception_mixins.dart';
import '../exceptions/token_exception.dart';
import '../web_service.dart';

class AuthInterceptor extends QueuedInterceptor with NetworkLoggy {
  final DioRef ref;
  AuthInterceptor(this.ref);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // check request marked as token not required
    // if nothing mentioned will add token
    if (options.headers.containsKey(NetworkConfig.dioNoTokenKey)) {
      // not required
      // then just continue to the next interceptor
      // remove the auxiliary header
      options.headers.remove(NetworkConfig.dioNoTokenKey);
      loggy.debug("Token not required returning");
      return handler.next(options);
    }

    var token = await AuthToken.token;
    if (token.isEmpty) {
      final error =
          DioError(requestOptions: options, type: DioErrorType.unknown);
      notifyApp(error, "Token is empty");
      return handler.reject(error);
    }

    // if it is normal token then return
    // no need to check expire or not
    if (!Environment.isJWT) {
      options.headers["Authorization"] = "${Environment.tokenTypeKey} $token";
      loggy.debug("Token ok, Not JWT");
      return handler.next(options);
    }

    // now handle JWT
    var refresh = await AuthToken.refresh;

    // check if tokens have already expired or not
    final accessTokenHasExpired = JwtDecoder.isExpired(token);
    final refreshTokenHasExpired = JwtDecoder.isExpired(refresh);

    var _refreshed = true;

    if (refreshTokenHasExpired) {
      final error =
          DioError(requestOptions: options, type: DioErrorType.unknown);
      notifyApp(error, "Refresh Token has been expired");
      return handler.reject(error);
    } else if (accessTokenHasExpired) {
      // regenerate access token
      _refreshed = await _regenerateAccessToken();
    }

    if (_refreshed) {
      // add access token to the request header
      options.headers["Authorization"] = "${Environment.tokenTypeKey} $token";
      return handler.next(options);
    } else {
      final error =
          DioError(requestOptions: options, type: DioErrorType.unknown);
      notifyApp(error, "Not able to generate access token");
      return handler.reject(error);
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    var error = err.copyWith();
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      // for some reasons the token can be invalidated before it is expired by the backend.
      // then we should navigate the user back to login page
      error = err.copyWith(error: DioErrorType.unknown);
      notifyApp(error, "Token has expired");
    }

    return handler.next(err);
  }

  void notifyApp(Exception exception, dynamic message, {dynamic extra}) {
    // clear token
    AuthToken.updateToken = "";
    AuthToken.updateRefresh = "";

    var data = ref.read(appStateNotifierProvider.notifier);
    var state = ref.read(appStateNotifierProvider).copyWith(
          exception: TokenException(
            exception: exception,
            action: ExceptionAction.logout,
            message: message,
            extra: extra,
          ),
        );
    data.onEvent(state, AppStateEvent.exception);
    loggy.error(message, exception);
  }

  // / return true if it is successfully regenerate the access token
  Future<bool> _regenerateAccessToken() async {
    try {
      var dio =
          Dio(); // should create new dio instance because the request interceptor is being locked

      // make request to server to get the new access token from server using refresh token
      var refresh = await AuthToken.refresh;

      final response = await dio.post(
        Environment.baseUrl + Environment.refreshTokenLink,
        options: Options(
          headers: {"Authorization": "${Environment.tokenTypeKey} $refresh"},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // TODO: handle access token key
        // parse data based on your JSON structure
        final newAccessToken = response.data["accessToken"];
        AuthToken.updateToken = newAccessToken; // save to local storage
        loggy.info("Token regenerated successfully");
        return true;
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        // it means your refresh token no longer valid now, it may be revoked by the backend
        loggy.error(response);
        return false;
      } else {
        loggy.debug(response.statusCode);
        return false;
      }
    } catch (e) {
      loggy.error("Refresh token error", e);
      return false;
    }
  }
}
