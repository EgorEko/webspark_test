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