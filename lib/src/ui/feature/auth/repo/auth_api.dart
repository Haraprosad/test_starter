import 'package:flutter_starter/src/core/repo/server/base_model/api_response.dart';

abstract class AuthAPi {
  Future<ApiResponse?> login(String email, String password);
}

