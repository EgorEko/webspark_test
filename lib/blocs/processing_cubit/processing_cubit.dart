import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'processing_state.dart';

class ProcessingCubit extends Cubit<ProcessingState> {
  ProcessingCubit() : super(const ProcessingState(0, 0));


  void settingInitialValues(int totalSteps){
    final divisionPrice = 100 ~/ totalSteps;
    emit(state.copyWith(divisionPrice: divisionPrice));
  }

  void updateProgress(int step){
    var progress = step * state.divisionPrice;
    if(progress > 100 - 5){
      progress = 100;
    }
    emit(state.copyWith(progress: progress));
  }
}
