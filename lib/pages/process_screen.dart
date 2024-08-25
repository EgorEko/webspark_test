import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/calculation_cubit/calculation_cubit.dart';
import '../blocs/data_exchange_bloc/data_exchange_bloc.dart';
import '../blocs/processing_cubit/processing_cubit.dart';
import '../common/app_colors.dart';
import '../models/vertex.dart';
import '../router/app_router.gr.dart';

@RoutePage()
class ProcessScreen extends StatelessWidget {
  const ProcessScreen({super.key, required this.vertexes});

  final List<VertexDto> vertexes;

  @override
  Widget build(BuildContext context) {
    context.read<CalculationCubit>().calculateShortcut(vertexes);
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
            BlocBuilder<ProcessingCubit, ProcessingState>(
              buildWhen: (p, c) => p.progress != c.progress,
              builder: (context, state) {
                return Text('${state.progress} %');
              },
            ),
            const Divider(),
            const Spacer(),
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width * 0.9,
                ),
                child: BlocBuilder<CalculationCubit, CalculationState>(
                  builder: (context, state) {
                    var result = [];
                    var steps = {};
                    for (var i = 0; i < state.resultStrings.length; i++) {
                      for (var k = 0; k < state.result[i].length; k++) {
                        final step = {
                          'x': state.result[i][k].x,
                          'y': state.result[i][k].y,
                        };
                        steps[k] = step;
                      }print(state.ids.length);
                      var id = state.ids[i];
                      var map = {
                        'id': id,
                        'result': {
                          'steps': steps,
                          'path': state.resultStrings[i],
                        },
                      };
                      result.add(map);
                      map.clear();
                      steps.clear();
                    }
                    return OutlinedButton(
                      onPressed: () {
                        context.read<DataExchangeBloc>().sendData(result);
                        context.router.push(const ResultListRoute());
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
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
