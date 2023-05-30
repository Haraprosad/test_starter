import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthToken {
  static FlutterSecureStorage? _fss;
  static const String _key = "auth_token";
  static const String _refresh = "auth_token";

  static FlutterSecureStorage _getInstance() {
    // TODO: handle ios options
    return _fss ??= const FlutterSecureStorage();
  }

  static Future<String> get token async =>
      await _getInstance().read(key: _key) ?? "";

  static Future<String> get refresh async =>
      await _getInstance().read(key: _refresh) ?? "";

  static set updateToken(String token) {
    _getInstance().write(key: _key, value: token);
  }

  static set updateRefresh(String token) {
    _getInstance().write(key: _refresh, value: token);
  }
}
