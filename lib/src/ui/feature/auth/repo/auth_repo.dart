import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/src/core/repo/server/base_model/api_response.dart';
import 'package:flutter_starter/src/core/repo/server/network_config.dart';
import 'package:flutter_starter/src/core/repo/server/web_service.dart';
import 'package:loggy/loggy.dart';

import 'auth_api.dart';

final authRepoProvider = Provider<AuthRepo>((ref) {
  return AuthRepo(ref);
});

class AuthRepo implements AuthAPi {
  final Ref _ref;

  late final Dio _dio = _ref.read(dioProvider);

  AuthRepo(this._ref);

  @override
  Future<ApiResponse> login(String email, String password) async {
    logDebug("Login with email: $email");
    var response =
        await _dio.get("/login", options: NetworkConfig.dioNoTokenOption);
    logDebug("Auth response data: ${response.data}");
    return ApiResponse.fromJson(response.data);
  }
}
