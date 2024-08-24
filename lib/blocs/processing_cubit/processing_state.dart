part of 'processing_cubit.dart';

class ProcessingState extends Equatable {
  const ProcessingState(this.progress, this.divisionPrice);

  final int progress;
  final int divisionPrice;

  @override
  List<Object> get props => [progress, divisionPrice];

  ProcessingState copyWith({
    int? progress,
    int? divisionPrice,
  }) {
    return ProcessingState(
      progress ?? this.progress,
      divisionPrice ?? this.divisionPrice,
    );
  }
}
