// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AuthorizationPage]
class AuthorizationRoute extends PageRouteInfo<AuthorizationRouteArgs> {
  AuthorizationRoute({
    Key? key,
    required Uri authorizationUrl,
    required void Function(Uri) onAuthorizationRedirectAttempt,
    List<PageRouteInfo>? children,
  }) : super(
         AuthorizationRoute.name,
         args: AuthorizationRouteArgs(
           key: key,
           authorizationUrl: authorizationUrl,
           onAuthorizationRedirectAttempt: onAuthorizationRedirectAttempt,
         ),
         initialChildren: children,
       );

  static const String name = 'AuthorizationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AuthorizationRouteArgs>();
      return AuthorizationPage(
        key: args.key,
        authorizationUrl: args.authorizationUrl,
        onAuthorizationRedirectAttempt: args.onAuthorizationRedirectAttempt,
      );
    },
  );
}

class AuthorizationRouteArgs {
  const AuthorizationRouteArgs({
    this.key,
    required this.authorizationUrl,
    required this.onAuthorizationRedirectAttempt,
  });

  final Key? key;

  final Uri authorizationUrl;

  final void Function(Uri) onAuthorizationRedirectAttempt;

  @override
  String toString() {
    return 'AuthorizationRouteArgs{key: $key, authorizationUrl: $authorizationUrl, onAuthorizationRedirectAttempt: $onAuthorizationRedirectAttempt}';
  }
}

/// generated route for
/// [SignInPage]
class SignInRoute extends PageRouteInfo<void> {
  const SignInRoute({List<PageRouteInfo>? children})
    : super(SignInRoute.name, initialChildren: children);

  static const String name = 'SignInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignInPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [StarredReposPage]
class StarredReposRoute extends PageRouteInfo<void> {
  const StarredReposRoute({List<PageRouteInfo>? children})
    : super(StarredReposRoute.name, initialChildren: children);

  static const String name = 'StarredReposRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StarredReposPage();
    },
  );
}
