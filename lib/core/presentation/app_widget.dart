import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:re_so_fl_ttr/auth/application/auth_notifier.dart';
import 'package:re_so_fl_ttr/auth/shared/provider.dart';
import 'package:re_so_fl_ttr/core/presentation/routes/app_router.dart';

final initializationProvider = FutureProvider.autoDispose<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  await authNotifier.checkAndUpdateAuthStatus();
  return unit;
});

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        ref.read(initializationProvider.future);

        ref.listen<AuthState>(authNotifierProvider, (_, authState) {
          authState.maybeMap(
            authenticated: (_) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _appRouter.replaceAll([const StarredReposRoute()]);
              });
            },
            unauthenticated: (_) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _appRouter.replaceAll([const SignInRoute()]);
              });
            },
            orElse: () {},
          );
        });

        return MaterialApp.router(
          routerConfig: _appRouter.config(),
          title: 'Repo Viewer App',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
