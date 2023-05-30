import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/src/core/config/gen/assets.gen.dart';
import 'package:flutter_starter/src/extensions/extension.dart';
import 'package:flutter_starter/src/router/app_router.dart';
import 'package:flutter_starter/src/router/router_provider.dart';
import 'package:flutter_starter/src/ui/config/sp_key.dart';
import 'package:go_router/go_router.dart';

class SplashScreenUI extends ConsumerWidget {
  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //after 2s navigate to login page
    Future.delayed(const Duration(seconds: 2), () {
      handleSplashScreen(ref);
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: AppConfig.dimen.splashImage.w,
              child: Assets.img.appIcon.image(),
            ),
          ),
          Center(
            child: Text(
              "Next generation hiring solution",
              style: TextStyle(
                fontSize: 15.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handleSplashScreen(WidgetRef ref) async {
    var value = await SPKeyConstant.loginState.spGetBool ?? false;
    // TODo: use go named
    // TO UPDATE
    SPKeyConstant.loginState.spBoolSet(true);

    if (value) {
      ref.read(routerProvider).pushReplacementNamed(AppRouter.home.name);
    } else {
      ref.read(routerProvider).pushReplacementNamed(AppRouter.login.name);
    }
  }
}
