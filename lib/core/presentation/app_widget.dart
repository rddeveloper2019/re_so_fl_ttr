import 'package:flutter/material.dart';
import 'package:re_so_fl_ttr/core/presentation/routes/app_router.dart';

class AppWidget extends StatelessWidget {
  final _appRouter = AppRouter();

  AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'My App',
      debugShowCheckedModeBanner: false,
    );
  }
}
