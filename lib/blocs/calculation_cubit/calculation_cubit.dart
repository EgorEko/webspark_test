import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/vertex.dart';
import '../processing_cubit/processing_cubit.dart';

part 'calculation_state.dart';

class CalculationCubit extends Cubit<CalculationState> {
  CalculationCubit(this.progress)
      : super(const CalculationState([], [], 0, [], []));

  final ProcessingCubit progress;

  void calculateShortcut(List<VertexDto> vertexes) {
    for (var vertex in vertexes) {
      if (vertex.start['x'] != null && vertex.start['y'] != null) {
         final start =
            Point<int>(vertex.start['x']!.toInt(), vertex.start['y']!.toInt());
        final end =
            Point<int>(vertex.end['x']!.toInt(), vertex.end['y']!.toInt());
        final maxStepCount = _calculateMaxStepCount(start, end);
        final blockedCellsList = <List<Point>>[];
        if (state.blockedCells.isNotEmpty) {
          blockedCellsList.addAll(state.blockedCells);
        }
        final blockedCells = _calculateBlockedCells(vertex);
        blockedCellsList.add(blockedCells);
        if (start.x <= end.x && start.y >= end.y) {
          final shortcut =
              _calculateUpRight(start, end, maxStepCount, blockedCells);
          blockedCells.clear();
          var shortcutTotal = <List<Point>>[];
          if (state.result.isNotEmpty) {
            shortcutTotal.addAll(state.result);
          }
          shortcutTotal.add(shortcut);
          var maxGridValue = <int>[];
          if (state.maxGridValue.isNotEmpty) {
            maxGridValue.addAll(state.maxGridValue);
          }
          maxGridValue.add(shortcut.length);
          emit(
            state.copyWith(
              result: shortcutTotal,
              maxGridValue: maxGridValue,
            ),
          );
        }
        if (start.x >= end.x && start.y >= end.y) {
          final shortcut =
              _calculateUpLeft(start, end, maxStepCount, blockedCells);
          final shortcutTotal = state.result;
          shortcutTotal.add(shortcut);
          var maxGridValue = <int>[];
          if (state.maxGridValue.isNotEmpty) {
            maxGridValue.addAll(state.maxGridValue);
          }
          maxGridValue.add(shortcut.length);
          emit(
            state.copyWith(
              result: shortcutTotal,
              maxGridValue: maxGridValue,
            ),
          );
        }
        if (start.x <= end.x && start.y <= end.y) {
          final shortcut =
              _calculateDownRight(start, end, maxStepCount, blockedCells);
          var shortcutTotal = <List<Point>>[];
          if (state.result.isNotEmpty) {
            shortcutTotal.addAll(state.result);
          }
          shortcutTotal.add(shortcut);
          var maxGridValue = <int>[];
          if (state.maxGridValue.isNotEmpty) {
            maxGridValue.addAll(state.maxGridValue);
          }
          maxGridValue.add(shortcut.length);
          emit(
            state.copyWith(
              result: shortcutTotal,
              maxGridValue: maxGridValue,
            ),
          );
        }
        if (start.x >= end.x && start.y <= end.y) {
          final shortcut =
              _calculateDownLeft(start, end, maxStepCount, blockedCells);
          var shortcutTotal = <List<Point>>[];
          if (state.result.isNotEmpty) {
            shortcutTotal.addAll(state.result);
          }
          shortcutTotal.add(shortcut);
          var maxGridValue = <int>[];
          if (state.maxGridValue.isNotEmpty) {
            maxGridValue.addAll(state.maxGridValue);
          }
          maxGridValue.add(shortcut.length);
          emit(
            state.copyWith(
              result: shortcutTotal,
              maxGridValue: maxGridValue,
            ),
          );
        }
      }
    }
    _updateResultStrings();
  }

  void setupIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void _updateResultStrings() {
    final result = state.result;
    var resultString = StringBuffer();
    final items = <String>[];
    for (var i = 0; i < result.length; i++) {
      for (var k = 0; k < result[i].length; k++) {
        resultString.write('(');
        resultString.write(result[i][k].x);
        resultString.write(',');
        resultString.write(result[i][k].y);
        resultString.write(')');
        if (k < result[i].length - 1) {
          resultString.write('->');
        }
      }
      items.add(resultString.toString());
      resultString.clear();
      emit(state.copyWith(resultStrings: items));
    }
  }

  List<Point> _calculateUpRight(
    Point start,
    Point end,
    int maxStepCount,
    List<Point> blockedCells,
  ) {
    var shortcut = <Point>[];
    shortcut.add(Point(start.x, start.y));
    var x = start.x;
    var y = start.y;
    progress.settingInitialValues(maxStepCount);
    var additionalStep = 0;
    for (var i = 0; i < maxStepCount + additionalStep; i++) {
      if (start.x + i < end.x) {
        x += 1;
      }
      for (var k = 0; k < maxStepCount; k++) {
        if (start.y - i + additionalStep > end.y) {
          y = y - 1 + k;
        }
        if (!blockedCells.contains(Point(x, y))) {
          break;
        }
        if (k > 0) {
          additionalStep += 1;
        }
      }

      shortcut.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    return shortcut;
  }

  List<Point> _calculateDownRight(
    Point start,
    Point end,
    int maxStepCount,
    List<Point> blockedCells,
  ) {
    var shortcut = <Point>[];
    shortcut.add(Point(start.x, start.y));
    var x = start.x;
    var y = start.y;
    progress.settingInitialValues(maxStepCount);
    var additionalStep = 0;
    for (var i = 0; i < maxStepCount + additionalStep; i++) {
      if (start.x + i < end.x) {
        x += 1;
      }
      for (var k = 0; k < maxStepCount; k++) {
        if (start.y - i + additionalStep > end.y) {
          y = y + 1 + k;
        }
        if (!blockedCells.contains(Point(x, y))) {
          break;
        }
        if (k > 0) {
          additionalStep += 1;
        }
      }

      shortcut.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    return shortcut;
  }

  List<Point> _calculateUpLeft(
    Point start,
    Point end,
    int maxStepCount,
    List<Point> blockedCells,
  ) {
    var shortcut = <Point>[];
    shortcut.add(Point(start.x, start.y));
    var x = start.x;
    var y = start.y;
    progress.settingInitialValues(maxStepCount);
    var additionalStep = 0;
    for (var i = 0; i < maxStepCount + additionalStep; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      for (var k = 0; k < maxStepCount; k++) {
        if (start.y - i + additionalStep > end.y) {
          y = y - 1 + k;
        }
        if (!blockedCells.contains(Point(x, y))) {
          break;
        }
        if (k > 0) {
          additionalStep += 1;
        }
      }

      shortcut.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    return shortcut;
  }

  List<Point> _calculateDownLeft(
    Point start,
    Point end,
    int maxStepCount,
    List<Point> blockedCells,
  ) {
    var shortcut = <Point>[];
    shortcut.add(Point(start.x, start.y));
    var x = start.x;
    var y = start.y;
    progress.settingInitialValues(maxStepCount);
    var additionalStep = 0;
    for (var i = 0; i < maxStepCount + additionalStep; i++) {
      if (start.x - i > end.x) {
        x -= 1;
      }
      for (var k = 0; k < maxStepCount; k++) {
        if (start.y + i + additionalStep < end.y) {
          y = y + 1 + k;
        }
        if (!blockedCells.contains(Point(x, y))) {
          break;
        }
        if (k > 0) {
          additionalStep += 1;
        }
      }

      shortcut.add(Point(x, y));
      progress.updateProgress(i);
    }
    progress.updateProgress(maxStepCount);
    return shortcut;
  }

  int _calculateMaxStepCount(Point<int> start, Point<int> end) {
    final maxX = (end.x - start.x).abs();
    final maxY = (end.y - start.y).abs();
    final maxStepCount = max(maxX, maxY);
    return maxStepCount.toInt();
  }

  List<Point> _calculateBlockedCells(VertexDto vertex) {
    final field = vertex.field;
    var blockedCells = <Point>[];
    for (var i = 0; i < field.length; i++) {
      for (var k = 0; k < field[i].length; k++) {
        if (field[i][k] == 'X') {
          blockedCells.add(Point(k, i));
        }
      }
    }
    return blockedCells;
  }
}
