import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_so_fl_ttr/auth/shared/provider.dart';
import 'package:re_so_fl_ttr/core/presentation/routes/app_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class SignInPage extends ConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(MdiIcons.github, size: 150),
                  SizedBox(height: 32),
                  Text(
                    "Welcome to Repo Viewer",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authNotifierProvider.notifier).signIn((
                        Uri authorizationUrl,
                      ) async {
                        await WebViewCookieManager().clearCookies();

                        final completer = Completer<Uri>();

                        AutoRouter.of(context).push(
                          AuthorizationRoute(
                            authorizationUrl: authorizationUrl,
                            onAuthorizationRedirectAttempt: (redirectUrl) {
                              completer.complete(redirectUrl);
                            },
                          ),
                        );

                        return completer.future;
                      });
                    },

                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
