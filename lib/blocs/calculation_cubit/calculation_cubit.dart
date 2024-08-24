import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/vertex.dart';
import '../processing_cubit/processing_cubit.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit() : super(const CalculationState({}, 0));

  void calculateShortcut(List<VertexDto> vertexes) {
    for (var vertex in vertexes) {
      if (vertex.start['x'] != null && vertex.start['y'] != null) {
        final start = Point<int>(vertex.start['x']!.toInt(), vertex.start['y']!.toInt());
        final end = Point<int>(vertex.end['x']!.toInt(), vertex.end['y']!.toInt());
        final id = vertex.id;
        final maxStepCount = _calculateMaxStepCount(start, end);
        if (start.x <= end.x && start.y >= end.y) {
          final shortcut = _calculateUpRight(start, end, maxStepCount, id);
          emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
        }
        if (start.x >= end.x && start.y >= end.y) {
          final shortcut = _calculateUpLeft(start, end, maxStepCount, id);
          emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
        }
        if (start.x <= end.x && start.y <= end.y) {
          final shortcut = _calculateDownRight(start, end, maxStepCount, id);
          emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
        }
        if (start.x >= end.x && start.y <= end.y) {
          final shortcut = _calculateDownLeft(start, end, maxStepCount, id);
          emit(state.copyWith(result: shortcut, maxGridValue: shortcut.length));
        }
      }
    }
  }

  Map<String, List<Point>> _calculateUpRight(
    Point start,
    Point end,
    int maxStepCount,
    String id,
  ) {
    final shortcut = {
      id: <Point>[Point(start.x, start.y)],
    };
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
      shortcut[id]?.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    return shortcut;
  }

  Map<String, List<Point>> _calculateDownRight(
    Point start,
    Point end,
    int maxStepCount,
    String id,
  ) {
    final shortcut = {
      id: <Point>[Point(start.x, start.y)],
    };
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x + i < end.x) {
        x += 1;
      }
      if (start.y + i < end.y) {
        y += 1;
      }
      shortcut[id]?.add(Point(x, y));
    }
    return shortcut;
  }

  Map<String, List<Point>> _calculateUpLeft(
    Point start,
    Point end,
    int maxStepCount,
    String id,
  ) {
    final shortcut = {
      id: <Point>[Point(start.x, start.y)],
    };
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      if (start.y - i > end.y) {
        y -= 1;
      }
      shortcut[id]?.add(Point(x, y));
    }
    return shortcut;
  }

  Map<String, List<Point>> _calculateDownLeft(
    Point start,
    Point end,
    int maxStepCount,
    String id,
  ) {
    final shortcut = {
      id: <Point>[Point(start.x, start.y)],
    };
    var x = start.x;
    var y = start.y;
    for (var i = 0; i < maxStepCount; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      if (start.y + i < end.y) {
        y += 1;
      }
      shortcut[id]?.add(Point(x, y));
    }
    return shortcut;
  }

  int _calculateMaxStepCount(Point start, Point end) {
    final maxX = (end.x - start.x).abs();
    final maxY = (end.y - start.y).abs();
    final maxStepCount = max(maxX, maxY);
    return maxStepCount.toInt();
  }
}
