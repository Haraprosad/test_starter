import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/src/core/config/my_env.dart';
import 'package:flutter_starter/src/extensions/app_config.dart';
import 'package:flutter_starter/src/router/router_provider.dart';
import 'package:go_router/go_router.dart';

import '../config/theme/theme_dark.dart';
import '../config/theme/theme_light.dart';
import 'provider/app/app_provider.dart';
import 'provider/theme/theme_provider.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter router = ref.watch(routerProvider);
    var themeMode = ref.watch(themeNotifierProvider);

    // TODO: The specific widget that could not find a ScaffoldMessenger ancestor was: MyApp
    // ref.listen(appStateNotifierProvider, (previous, next) {
    //   if (next.event == AppStateEvent.snackbar) {
    //     loggy.debug("UI show: ${next.message} and show snackbar");
    //     // show snackbar here
    //     context.showSnackbar(
    //       SnackBar(
    //         content: Text(next.message),
    //       ),
    //     );
    //   }
    // });

    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        AppConfig(
          designScreenWidth: 436,
          designScreenHeight: 696,
        ).init(context, constraints, orientation);

        return MaterialApp.router(
          routerConfig: router,
          title: Environment.appName,
          debugShowCheckedModeBanner: !Environment.isProduction,
          theme: ThemeLight.theme,
          darkTheme: ThemeDark.theme,
          themeMode: themeMode ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      });
    });
  }
}
