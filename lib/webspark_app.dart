import 'package:flutter/material.dart';

import 'router/app_router.dart';

class WebsparkApp extends StatelessWidget {
  WebsparkApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}