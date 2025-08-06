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

class AppWidget extends ConsumerStatefulWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  ConsumerState<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends ConsumerState<AppWidget> {
  @override
  void initState() {
    super.initState();
    ref.read(initializationProvider);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch<AuthState>(authNotifierProvider);

    authState.maybeMap(
      authenticated: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget._appRouter.replaceAll([const StarredReposRoute()]);
        });
      },
      unauthenticated: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget._appRouter.replaceAll([const SignInRoute()]);
        });
      },
      orElse: () {},
    );

    return MaterialApp.router(
      routerConfig: widget._appRouter.config(),
      title: 'My App',
      debugShowCheckedModeBanner: false,
    );
  }
}
