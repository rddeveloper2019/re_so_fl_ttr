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

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.exists(initializationProvider)) {
      ref.read(initializationProvider.future);
    }

    _handleNavigation(ref);

    return MaterialApp.router(
      routerConfig: ref.watch(appRouterProvider).config(),
      title: 'My App',
      debugShowCheckedModeBanner: false,
    );
  }

  void _handleNavigation(WidgetRef ref) {
    final authState = ref.watch(authNotifierProvider);
    final router = ref.read(appRouterProvider);

    authState.maybeMap(
      authenticated: (_) {
        Future.microtask(() => router.replaceAll([const StarredReposRoute()]));
      },
      unauthenticated: (_) {
        Future.microtask(() => router.replaceAll([const SignInRoute()]));
      },
      orElse: () {},
    );

    // if (authState is Authenticated) {
    //   Future.microtask(() => router.replaceAll([const StarredReposRoute()]));
    // } else if (authState is Unauthenticated) {
    //   Future.microtask(() => router.replaceAll([const SignInRoute()]));
    // }
  }
}

// Выносим роутер в провайдер
final appRouterProvider = Provider((ref) => AppRouter());

// class AppWidget extends ConsumerStatefulWidget {
//   final _appRouter = AppRouter();

//   AppWidget({super.key});

//   @override
//   ConsumerState<AppWidget> createState() => _AppWidgetState();
// }

// class _AppWidgetState extends ConsumerState<AppWidget> {
//   @override
//   void initState() {
//     super.initState();
//     ref.read(initializationProvider);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authState = ref.watch<AuthState>(authNotifierProvider);

//     authState.maybeMap(
//       authenticated: (_) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           widget._appRouter.replaceAll([const StarredReposRoute()]);
//         });
//       },
//       unauthenticated: (_) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           widget._appRouter.replaceAll([const SignInRoute()]);
//         });
//       },
//       orElse: () {},
//     );

//     return MaterialApp.router(
//       routerConfig: widget._appRouter.config(),
//       title: 'My App',
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:re_so_fl_ttr/auth/shared/provider.dart';
// import 'package:re_so_fl_ttr/core/presentation/routes/app_router.dart';

// final initializationProvider = FutureProvider.autoDispose<Unit>((ref) async {
//   final authNotifier = ref.read(authNotifierProvider.notifier);
//   await authNotifier.checkAndUpdateAuthStatus();
//   return unit;
// });

// class AppWidget extends StatelessWidget {
//   final _appRouter = AppRouter();

//   AppWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         // Запускаем инициализацию при первом построении
//         ref.read(initializationProvider.future);
        
//         // Слушаем изменения состояния аутентификации
//         ref.listen<AuthState>(authNotifierProvider, (_, authState) {
//           authState.maybeMap(
//             authenticated: (_) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 _appRouter.replaceAll([const StarredReposRoute()]);
//               });
//             },
//             unauthenticated: (_) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 _appRouter.replaceAll([const SignInRoute()]);
//               });
//             },
//             orElse: () {},
//           );
//         });

//         return MaterialApp.router(
//           routerConfig: _appRouter.config(),
//           title: 'My App',
//           debugShowCheckedModeBanner: false,
//         );
//       },
//     );
//   }
// }