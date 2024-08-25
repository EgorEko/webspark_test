part of 'calculation_cubit.dart';

class CalculationState extends Equatable {
  const CalculationState(
      this.result, this.maxGridValue, this.index, this.resultStrings);

  final List<List<Point>> result;
  final List<int> maxGridValue;
  final int index;
  final List<String> resultStrings;

  @override
  List<Object?> get props => [result, maxGridValue, index, resultStrings];

  CalculationState copyWith({
    List<List<Point>>? result,
    List<int>? maxGridValue,
    int? index,
    List<String>? resultStrings,
  }) {
    return CalculationState(
      result ?? this.result,
      maxGridValue ?? this.maxGridValue,
      index ?? this.index,
      resultStrings ?? this.resultStrings,
    );
  }
}
