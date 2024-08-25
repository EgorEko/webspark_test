part of 'data_exchange_bloc.dart';

abstract class DataExchangeState extends Equatable {
  const DataExchangeState();

  @override
  List<Object> get props => [];
}

class DataExchangeInitial extends DataExchangeState {}

class DataExchangeLoading extends DataExchangeState {}

class DataExchangeSucceed extends DataExchangeState {
  const DataExchangeSucceed(this.vertexes);

  final List<VertexDto> vertexes;

  @override
  List<Object> get props => [vertexes];
}

class DataExchangeSendSucceed extends DataExchangeState {
  const DataExchangeSendSucceed(this.message);

  final MessageDto message;

  @override
  List<Object> get props => [message];
}

class DataExchangeFailed extends DataExchangeState {
  const DataExchangeFailed(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
