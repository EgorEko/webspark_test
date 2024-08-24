import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculation_cubit/calculation_cubit.dart';
import '../common/app_colors.dart';

@RoutePage()
class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Preview screen',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: BlocBuilder<CalculationCubit, CalculationState>(
        builder: (context, state) {
          var items = <Point>[];
          for (var i = 0; i < state.maxGridValue; i++) {
            for (var k = 0; k < state.maxGridValue; k++) {
              items.add(Point(k, i));
            }
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: state.maxGridValue,
            ),
            itemBuilder: (context, index) {
              return Card(
                color: (items[index].x == state.result[0].x &&
                        items[index].y == state.result[0].y)
                    ? AppColors.start
                    : (items[index].x == state.result[state.result.length -1].x &&
                            items[index].y ==
                                state.result[state.result.length- 1].y)
                        ? AppColors.finish
                        : state.result.contains(items[index])
                            ? AppColors.shortcut
                            : AppColors.white,
                child: Center(
                    child: Text('(${items[index].x}, ${items[index].y})'),),
              );
            },
            itemCount: state.maxGridValue * (state.maxGridValue),
          );
        },
      ),
    );
  }
}
