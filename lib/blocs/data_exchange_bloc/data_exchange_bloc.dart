import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/api_service.dart';
import '../../models/vertex.dart';

part 'data_exchange_event.dart';

part 'data_exchange_state.dart';

class DataExchangeBloc extends Bloc<DataExchangeEvent, DataExchangeState> {
  DataExchangeBloc() : super(DataExchangeInitial()) {
    on<FetchDataExchangeEvent>((event, emit) async {
      try {
        if (state is DataExchangeInitial) {
          emit(DataExchangeLoading());
          ApiService apiService = ApiService();
          final response = await apiService.fetchData(event.path);
          emit(DataExchangeSucceed(response));
        }
      } catch (e) {
        emit(DataExchangeFailed(e.toString()));
      }
    });
    on<SendDataExchangeEvent>((event, emit) async {
      try {
        emit(DataExchangeLoading());
        var result = [];
        var steps = {};
        for (var i = 0; i < event.resultStrings.length; i++) {
          for (var k = 0; k < event.result[i].length; k++) {
            final step = {
              'x': event.result[i][k].x,
              'y': event.result[i][k].y,
            };
            steps[k] = step;
          }
          var id = event.ids[i];
          var map = {
            'id': id,
            'result': {
              'steps': steps,
              'path': event.resultStrings[i],
            },
          };
          result.add(map);
          steps.clear();
        }
        ApiService apiService = ApiService();
        final response = await apiService.send(result);
        emit(DataExchangeSendSucceed(response));
      } catch (e) {
        emit(DataExchangeFailed(e.toString()));
      }
    });
  }

  void loadData(String path) {
    add(FetchDataExchangeEvent(path));
  }

  void sendData(List<String> resultStrings, List<List<Point<num>>> result,
      List<String> ids) {
    add(SendDataExchangeEvent(resultStrings, result, ids));
  }
}
