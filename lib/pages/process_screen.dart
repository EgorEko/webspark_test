import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculation_cubit/calculation_cubit.dart';
import '../common/app_colors.dart';

@RoutePage()
class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    const start = Point(3, 1);
    const end = Point(0, 3);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Process screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Center(
              child: Text(
                'All calculations has finished, you can send your results to server',
              ),
            ),
            const Divider(),
            const Spacer(),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                child: OutlinedButton(
                  onPressed: () {
                    context
                        .read<CalculationCubit>()
                        .calculateShortcut(start, end);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.backgroundPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: AppColors.cornerColor,
                    ),
                  ),
                  child: const Text(
                    'Send results to server',
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
