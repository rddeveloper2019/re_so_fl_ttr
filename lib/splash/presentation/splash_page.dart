import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(MdiIcons.github, size: 150),
            SizedBox(height: 16),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
