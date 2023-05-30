import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:flutter_starter/src/core/repo/server/exceptions/network_exception.dart';
import 'package:flutter_starter/src/router/router_provider.dart';
import 'package:loggy/loggy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/repo/server/exceptions/base_exception_mixins.dart';
import 'app_state.dart';

part 'app_provider.g.dart';

// Purpose of this AppStateNotifier
// it will work as a global state
// from any place we run any operation
//  -> show snackbar
//  -> show bottom sheet
//  -> FCM event

@Riverpod(keepAlive: true)
class AppStateNotifier extends _$AppStateNotifier {
  void onEvent(AppState state, AppStateEvent event) {
    if (event == AppStateEvent.exception && state.exception != null) {
      logDebug("Event received: ${state.exception?.message}");
      handleException(state.exception!);
    } else if (event == AppStateEvent.snackbar) {
      state = state;
    } else if (event == AppStateEvent.bottomsheet) {
      state = state;
    }
  }

  @override
  AppState build() => const AppState();

  //Set user specific data for firebase
  void setUserAuth(String userIdentifier) async {
    state = state.copyWith(isAuth: true);

    if (DefaultFirebaseOptions.currentPlatform != null) {
      await FirebaseAnalytics.instance.setUserId(id: userIdentifier);
      await FirebaseCrashlytics.instance.setUserIdentifier(userIdentifier);
    }
  }

  @protected
  void handleException(BaseAppException exception) {
    logDebug("Exception type ${exception is NetworkException}");
    // Don't know why exception is NetworkException is not working
    if (exception.action == ExceptionAction.logout) {
      state = state.copyWith(
          isAuth: false,
          event: AppStateEvent.snackbar,
          message: exception.message);
      ref.read(routerProvider).go("/");
    } else {
      state = state.copyWith(
          event: AppStateEvent.snackbar, message: exception.message);
      logDebug("Network exception: ${exception.message} and Snackbar");
    }
  }
}
