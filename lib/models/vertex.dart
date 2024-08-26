import 'package:json_annotation/json_annotation.dart';
import '../utils/typedefs.dart';

part 'vertex.g.dart';

@JsonSerializable()
class MessageDto {
  MessageDto(this.error, this.message, this.data);

  factory MessageDto.fromJson(Json json) => _$MessageDtoFromJson(json);
  final bool error;
  final String message;
  final List<Map<String, dynamic>> data;

  Json toJson() => _$MessageDtoToJson(this);
}

@JsonSerializable()
class VertexDto {
  VertexDto(this.id, this.field, this.start, this.end);

  factory VertexDto.fromJson(Json json) => _$VertexDtoFromJson(json);
  final String id;
  final List<String> field;
  final Map<String, dynamic> start;
  final Map<String, dynamic> end;

  Json toJson() => _$VertexDtoToJson(this);
}

@JsonSerializable()
class Request {
  Request(this.data);

  factory Request.fromJson(Json json) => _$RequestFromJson(json);
  final List<Map<String, dynamic>> data;


  Json toJson() => _$RequestToJson(this);
}


@JsonSerializable()
class Data {
  Data(this.id, this.result);

  factory Data.fromJson(Json json) => _$DataFromJson(json);
  final String id;
  final Map<String, dynamic> result;


  Json toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  Result(this.steps, this.path);

  factory Result.fromJson(Json json) => _$ResultFromJson(json);
  final List<Map<String, dynamic>> steps;
  final String path;


  Json toJson() => _$ResultToJson(this);
}

