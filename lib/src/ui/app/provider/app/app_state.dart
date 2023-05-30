import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/repo/server/exceptions/base_exception_mixins.dart';

part 'app_state.freezed.dart';

enum AppStateEvent {
  nothing,
  exception,
  snackbar,
  bottomsheet,
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    BaseAppException? exception,
    @Default(false) bool isAuth,
    @Default(AppStateEvent.nothing) AppStateEvent event,
    @Default("") String message,
  }) = _AppState;

  // BaseAppException? exception;
  // bool isAuth = false;
  // String message = "";
  // AppStateEvent event;
}
