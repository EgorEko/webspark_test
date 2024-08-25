import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/calculation_cubit/calculation_cubit.dart';
import 'blocs/data_exchange_bloc/data_exchange_bloc.dart';
import 'blocs/processing_cubit/processing_cubit.dart';
import 'webspark_app.dart';

void main() {
  final process = ProcessingCubit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => process),
        BlocProvider(create: (_) => CalculationCubit(process)),
        BlocProvider(create: (_) => DataExchangeBloc()),
      ],
      child: WebsparkApp(),
    ),
  );
}
