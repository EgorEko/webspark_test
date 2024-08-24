import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

@RoutePage()
class ResultListScreen extends StatelessWidget {
  const ResultListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Result list screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
    );
  }
}
