import 'package:auto_route/auto_route.dart';
import 'package:re_so_fl_ttr/auth/presentation/sign_in_page.dart';
import 'package:re_so_fl_ttr/splash/presentation/splash_page.dart';
import 'package:re_so_fl_ttr/starred_repos/presentation/starred_repos_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: SignInRoute.page, path: '/sign-in'),
    AutoRoute(page: StarredReposRoute.page, path: '/starred'),
  ];
}
