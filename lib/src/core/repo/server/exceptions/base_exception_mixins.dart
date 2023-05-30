enum AppExceptionType { token, network, unknown }

enum ExceptionAction {
  nothing,
  retry,
  logout,
}

abstract class BaseAppException with Exception {
  // actions
  ExceptionAction action = ExceptionAction.nothing;

  // main exception
  Exception? exception;

  // custom message
  dynamic message;

  // stack trace
  StackTrace? stackTrace;

  dynamic extra;
}
