import 'package:flutter/material.dart';

import 'common/app_colors.dart';
import 'router/app_router.dart';

class WebsparkApp extends StatelessWidget {
  WebsparkApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.backgroundPrimary,
          iconTheme: const IconThemeData().copyWith(color: AppColors.white),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}