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
