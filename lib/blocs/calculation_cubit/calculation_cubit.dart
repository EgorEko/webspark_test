import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../processing_cubit/processing_cubit.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(const CalculationState([], 0));

  void calculateShortcut(Point start, Point end) {
    final maxStepCount = _calculateMaxStepCount(start, end);
    if (start.x <= end.x && start.y >= end.y) {
      final shortcut = _calculateUpRight(start, end, maxStepCount);
      emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
    }
    if (start.x >= end.x && start.y >= end.y) {
      final shortcut = _calculateUpLeft(start, end, maxStepCount);
      emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
    }
    if (start.x <= end.x && start.y <= end.y) {
      final shortcut = _calculateDownRight(start, end, maxStepCount);
      emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
    }
    if (start.x >= end.x && start.y <= end.y) {
      final shortcut = _calculateDownLeft(start, end, maxStepCount);
      emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
    }
  }

  List<Point> _calculateUpRight(Point start, Point end, int maxStepCount) {
    final shortcut = <Point>[Point(start.x, start.y)];
    var x = start.x;
    var y = start.y;
    final progress = ProcessingCubit();
    progress.settingInitialValues(maxStepCount);
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x + i < end.x) {
        x += 1;
      }
      if (start.y - i > end.y) {
        y -= 1;
      }
      shortcut.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    print(shortcut);
    return shortcut;
  }

  List<Point> _calculateDownRight(Point start, Point end, int maxStepCount) {
    final shortcut = <Point>[Point(start.x, start.y)];
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x + i < end.x) {
        x += 1;
      }
      if (start.y + i < end.y) {
        y += 1;
      }
      shortcut[i + 1] = Point(x, y);
    }
    print(shortcut);
    return shortcut;
  }

  List<Point> _calculateUpLeft(Point start, Point end, int maxStepCount) {
    final shortcut = <Point>[Point(start.x, start.y)];
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      if (start.y - i > end.y) {
        y -= 1;
      }
      shortcut[i + 1] = Point(x, y);
    }
    print(shortcut);
    return shortcut;
  }

  List<Point> _calculateDownLeft(Point start, Point end, int maxStepCount) {
    final shortcut = <Point>[Point(start.x, start.y)];
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      if (start.y + i < end.y) {
        y += 1;
      }
      shortcut[i + 1] = Point(x, y);
    }
    print(shortcut);
    return shortcut;
  }

  int _calculateMaxStepCount(Point start, Point end){
    final maxX = (end.x - start.x).abs();
    final maxY = (end.y - start.y).abs();
    final maxStepCount = max(maxX, maxY);
    return maxStepCount.toInt();
  }
}
