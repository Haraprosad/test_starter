import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_starter/src/core/config/gen/assets.gen.dart';
import 'package:flutter_starter/src/core/config/loggers/analytics_logger.dart';
import 'package:flutter_starter/src/extensions/extension.dart';
import 'package:flutter_starter/src/router/app_router.dart';
import 'package:flutter_starter/src/ui/app/provider/app/app_provider.dart';
import 'package:flutter_starter/src/ui/app/provider/app/app_state.dart';
import 'package:flutter_starter/src/ui/config/constants/color_constant.dart';
import 'package:flutter_starter/src/ui/feature/auth/model/user_model.dart';
import 'package:flutter_starter/src/ui/feature/auth/provider/auth_provider.dart';
import 'package:flutter_starter/src/ui/shared/widget/text/round_button.dart';
import 'package:flutter_starter/src/ui/shared/widget/text/text_field_container.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

class LoginPage extends HookConsumerWidget with UiLoggy {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    ref.listen(appStateNotifierProvider, (previous, next) {
      if (next.event == AppStateEvent.snackbar) {
        loggy.debug("UI show: ${next.message} and show snackbar");
        // show snackbar here
        context.showSnackbar(
          SnackBar(
            content: Text(next.message),
          ),
        );
      }
    });

    // handle navigation
    handleNavigation(context, ref);

    var passwordVisible = useState(false);

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: Assets.img.appIcon.image(),
            ),
            Text(
              "Next generation hiring solution",
              style: TextStyle(
                fontSize: 15.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: TextFieldContainer(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  cursorColor: ColorConstants.kPrimaryColor,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please add valid user name / email address";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: ColorConstants.kPrimaryColor,
                    ),
                    hintText: "Username or email address",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                obscureText: passwordVisible.value,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.length <= 4) {
                    return "please add valid password";
                  }

                  return null;
                },
                controller: passwordController,
                cursorColor: ColorConstants.kPrimaryColor,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: const Icon(
                    Icons.lock,
                    color: ColorConstants.kPrimaryColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      passwordVisible.value = !passwordVisible.value;
                    },
                    child: Icon(
                      passwordVisible.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: ColorConstants.kPrimaryColor,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "Login".toUpperCase(),
              onClick: () => handleClick(
                ref,
                emailController.text,
                passwordController.text,
              ),
            )
          ],
        ),
      ),
    );
  }

  /// If the user is not logged in, do nothing. If the user is logged in, navigate to the home page
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget.
  ///   ref (WidgetRef): The WidgetRef object that is passed to the widget.
  ///
  /// Returns:
  ///   A function that takes a BuildContext and a WidgetRef.
  void handleNavigation(BuildContext context, WidgetRef ref) {
    UserModel? user = ref.watch(authNotifierProvider);

    if (user == null) {
      return;
    }

    context.pushReplacementNamed(AppRouter.home.name);
  }

  /// If the form is valid, then call the login function on the AuthNotifier
  ///
  /// Args:
  ///   ref (WidgetRef): The WidgetRef of the widget that called the function.
  ///   email (String): The email address of the user.
  ///   password (String): The password entered by the user.
  ///
  /// Returns:
  ///   nothing
  void handleClick(WidgetRef ref, String email, String password) {
    // if (formKey.currentState?.validate() == false) {
    //   return;
    // }
    loggy.debug("Login button clicked");
    ref.read(authNotifierProvider.notifier).login("1a", "@1234@");
  }
}
