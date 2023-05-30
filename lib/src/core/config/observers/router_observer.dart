import 'package:flutter/material.dart';

import '../loggers/observer_logger.dart';

class GoNavigatorObserver extends NavigatorObserver with ObserverLogger {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    loggy.debug('Router: push route $route : $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    loggy.debug('Router: pop route $route : $previousRoute');
  }
}
