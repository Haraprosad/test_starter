import 'package:flutter_starter/src/core/config/loggers/analytics_logger.dart';
import 'package:flutter_starter/src/core/repo/server/auth_token.dart';
import 'package:flutter_starter/src/ui/app/provider/app/app_provider.dart';
import 'package:flutter_starter/src/ui/feature/auth/model/user_model.dart';
import 'package:flutter_starter/src/ui/feature/auth/repo/auth_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier with AnalyticsLogger {
  AuthNotifier() : super();

  void login(email, password) async {
    // log analytics
    analyticsLogin("email");

    ref.read(authRepoProvider).login(email, password).then((value) {
      var user = UserModel.fromJson(value.data);
      AuthToken.updateToken = user.token;
      // setup user data for firebase
      ref.read(appStateNotifierProvider.notifier).setUserAuth(user.id);
      state = user;
    }).catchError((error, stackTrace){
      loggy.error("Login error:", error, stackTrace);
      state = null;
    });
  }

  @override
  UserModel? build() => null;
}
