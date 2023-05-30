import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class NetworkConfig {
  static String dioNoTokenKey = "requiresToken";
  static Options dioNoTokenOption = Options(headers: {dioNoTokenKey: false});
  static Map<String, bool> dioNoTokenHeader = {dioNoTokenKey: false};

  static Future<bool> isNetworkAvailable() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
