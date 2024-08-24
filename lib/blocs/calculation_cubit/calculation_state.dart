part of 'calculation_cubit.dart';

class CalculationState extends Equatable {
  const CalculationState(this.result, this.maxGridValue);

  final List<Point> result;
  final int maxGridValue;

  @override
  List<Object?> get props => [result, maxGridValue];

  CalculationState copyWith({
    List<Point>? result,
    int? maxGridValue,
  }) {
    return CalculationState(
      result ?? this.result,
      maxGridValue ?? this.maxGridValue,
    );
  }
}
