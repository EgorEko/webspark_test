import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/calculation_cubit/calculation_cubit.dart';
import 'webspark_app.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CalculationCubit()),
      ],
      child: WebsparkApp(),
    ),
  );
}
