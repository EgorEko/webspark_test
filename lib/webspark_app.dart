import 'package:flutter/material.dart';

import 'pages/home_screen.dart';

class WebsparkApp extends StatelessWidget {
  const WebsparkApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}