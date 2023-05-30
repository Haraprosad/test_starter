import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';
import 'src/core/config/app_localizations.dart';
import 'src/core/config/observers/provider_observer.dart';
import 'src/ui/app/my_app.dart';
import 'package:loggy/loggy.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> runMainApp() async {
  // configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var app = EasyLocalization(
    supportedLocales: AppLocalizations.getSupportedLocals(),
    path: AppLocalizations.localPath,
    fallbackLocale: AppLocalizations.fallbackLocale,
    startLocale: AppLocalizations.startLocale,
    child: const MyApp(),
  );

  if (kDebugMode) {
    runApp(
      ProviderScope(
        observers: [
          PObserver(),
        ],
        child: app,
      ),
    );
  } else {
    runZonedGuarded(() async {
      runApp(
        ProviderScope(
          observers: [
            PObserver(),
          ],
          child: app,
        ),
      );
    }, (exception, stackTrace) async {
      logError("Something went wrong", exception, stackTrace);
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text('unexpected_error'.tr()),
          ),
          // TODO: Don't show stack trace to user
          body: Center(child: Text(details.toString())),
        );
      };
    });
  }
}
