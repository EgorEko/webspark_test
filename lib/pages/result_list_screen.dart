import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculation_cubit/calculation_cubit.dart';
import '../common/app_colors.dart';
import '../router/app_router.gr.dart';

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
      body: BlocBuilder<CalculationCubit, CalculationState>(
        builder: (context, state) {
          final result = state.result;
          var resultString = StringBuffer();
          for (var i = 0; i < result.length; i++) {
            resultString.write('(');
            resultString.write(result[i].x);
            resultString.write(',');
            resultString.write(result[i].y);
            resultString.write(')');
            if (i < result.length - 1) {
              resultString.write('->');
            }
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return Center(
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    context.router.push(const PreviewRoute());
                  },
                  initialValue: resultString.toString(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
