
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_service.dart';
import '../../models/vertex.dart';

part 'data_exchange_event.dart';
part 'data_exchange_state.dart';

class DataExchangeBloc extends Bloc<DataExchangeEvent, DataExchangeState> {
  DataExchangeBloc() : super(DataExchangeInitial()) {
    on<FetchDataExchangeEvent>((event, emit) async {
      try{
        if(state is DataExchangeInitial){
          emit(DataExchangeLoading());
          ApiService apiService = ApiService();
          final response = await apiService.fetchData(event.path);
          emit(DataExchangeSucceed(response));
        }
      }catch(e){
        emit(DataExchangeFailed(e.toString()));
      }
    });
  }

  void loadData(String path) {
    add(FetchDataExchangeEvent(path));
  }
}
