import 'base_exception_mixins.dart';

class TokenException implements BaseAppException {
  @override
  Exception? exception;

  @override
  dynamic extra;

  @override
  dynamic message;

  @override
  StackTrace? stackTrace;

  @override
  ExceptionAction action = ExceptionAction.nothing;

  TokenException({
    this.action = ExceptionAction.nothing,
    this.exception,
    this.stackTrace,
    this.message,
    this.extra,
  });

  TokenException copyWith({
    AppExceptionType? exceptionType,
    Exception? exception,
    dynamic extra,
    dynamic message,
    StackTrace? stackTrace,
    ExceptionAction? action,
  }) {
    return TokenException(
      exception: exception ?? this.exception,
      extra: extra ?? this.extra,
      message: message ?? this.message,
      stackTrace: stackTrace ?? this.stackTrace,
      action: action ?? this.action,
    );
  }

  @override
  bool operator ==(covariant TokenException other) {
    if (identical(this, other)) return true;

    return other.exception == exception &&
        other.extra == extra &&
        other.message == message &&
        other.stackTrace == stackTrace &&
        other.action == action;
  }

  @override
  int get hashCode {
    return exception.hashCode ^
        extra.hashCode ^
        message.hashCode ^
        stackTrace.hashCode ^
        action.hashCode;
  }
}
