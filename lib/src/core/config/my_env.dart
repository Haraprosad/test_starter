import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static bool get isProduction =>
      dotenv.get("IS_PRODUCTION", fallback: "") == "1";

  static String get appName => dotenv.get("APP_NAME", fallback: "");

  //
  static String get baseUrl => dotenv.get("BASE_URL", fallback: "");
  static String get tokenTypeKey =>
      dotenv.get("TOKEN_TYPE_KEY", fallback: "Token");

  static bool get isJWT => dotenv.get("IS_JWT", fallback: "") == "1";
  static String get refreshTokenLink =>
      dotenv.get("REFRESH_TOKEN_LINK", fallback: "");

  static String get refreshTokenUrl =>
      dotenv.get("REFRESH_TOKEN_URL", fallback: "");
}
