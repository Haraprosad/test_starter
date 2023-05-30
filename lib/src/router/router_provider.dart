import 'package:flutter/material.dart';
import 'package:flutter_starter/src/core/config/observers/router_observer.dart';
import 'package:flutter_starter/src/ui/feature/auth/widget/login.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../ui/app/splash/splash_ui.dart';
import 'app_router.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  return GoRouter(
    initialLocation: "/",
    errorBuilder: (context, state) {
      return Container();
    },
    routes: [
      GoRoute(
        path: '/',
        name: AppRouter.splash.name,
        builder: (context, state) => const SplashScreenUI(),
      ),
      GoRoute(
        path: '/login',
        name: AppRouter.login.name,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: AppRouter.home.name,
        builder: (context, state) => Container(),
      ),
    ],
    observers: [
      GoNavigatorObserver(),
    ],
  );
}
