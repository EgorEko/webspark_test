part of 'data_exchange_bloc.dart';

abstract class DataExchangeEvent extends Equatable {
  const DataExchangeEvent();

  @override
  List<Object> get props => [];
}

class FetchDataExchangeEvent extends DataExchangeEvent {
  const FetchDataExchangeEvent(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}

class SendDataExchangeEvent extends DataExchangeEvent {
  const SendDataExchangeEvent(this.resultStrings, this.result, this.ids);

  final List<String> resultStrings;
  final List<List<Point<num>>> result;
  final List<String> ids;


  @override
  List<Object> get props => [resultStrings, result, ids];
}

