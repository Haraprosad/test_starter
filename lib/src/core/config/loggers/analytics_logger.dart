import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:loggy/loggy.dart';

mixin AnalyticsLogger implements LoggyType {
  @override
  Loggy<AnalyticsLogger> get loggy => Loggy<AnalyticsLogger>('Analytics');

  void analyticsScreenView(String screenClass, String screenName) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance
        .logScreenView(screenClass: screenClass, screenName: screenName);
  }

  void analyticsEvent(String name, Map<String, dynamic> parameters) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance
        .logEvent(name: name, parameters: parameters);
  }

  void analyticsSignUp(String signUpMethod) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance.logSignUp(signUpMethod: signUpMethod);
  }

  void analyticsLogin(String loginMethod) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance.logLogin(loginMethod: loginMethod);
  }

  void analyticsShare(String contentType, String itemId, String method) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance
        .logShare(contentType: contentType, itemId: itemId, method: method);
  }

  void analyticsAppOpen() async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance.logAppOpen();
  }

  void analyticsBeginCheckout(double value,
      {String currency = 'USD',
      List<AnalyticsEventItem> item = const [],
      String coupon = ''}) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance.logBeginCheckout(
        value: value, currency: currency, items: item, coupon: coupon);
  }

  void analyticsSearch(String searchTerm) async {
    if (DefaultFirebaseOptions.currentPlatform == null) return;
    await FirebaseAnalytics.instance.logSearch(searchTerm: searchTerm);
  }
}
