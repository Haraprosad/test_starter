import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_starter/firebase_options.dart';
import 'package:loggy/loggy.dart';

class CrashlyticsPrinter extends LoggyPrinter {
  CrashlyticsPrinter();
  @override
  void onLog(LogRecord record) {
    if (DefaultFirebaseOptions.currentPlatform == null) {
      return;
    }

    if (record.level == LogLevel.error) {
      FirebaseCrashlytics.instance
          .recordError(record.error, record.stackTrace, reason: record.message);
    } else if (record.level == LogLevel.info) {
      FirebaseCrashlytics.instance.log(record.message);
    }
  }
}

class LoggerConfig {
  static void init(LogOptions options, {List<LoggyFilter>? filters}) {
    Loggy.initLoggy(
      logOptions: options,
      filters: filters ?? [],
      logPrinter: kReleaseMode
          ? CrashlyticsPrinter()
          : const PrettyPrinter(showColors: true),
    );

    // * Handle errors from Flutter
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      logError(details, details.stack);
    };

    // * Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      logError(error, stack);
      return true;
    };
  }
}
