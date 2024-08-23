// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => MessageDto(
      json['error'] as bool,
      json['message'] as String,
      json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$MessageDtoToJson(MessageDto instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

VertexDto _$VertexDtoFromJson(Map<String, dynamic> json) => VertexDto(
      json['id'] as String,
      (json['field'] as List<dynamic>).map((e) => e as String).toList(),
      Map<String, int>.from(json['start'] as Map),
      Map<String, int>.from(json['end'] as Map),
    );

Map<String, dynamic> _$VertexDtoToJson(VertexDto instance) => <String, dynamic>{
      'id': instance.id,
      'field': instance.field,
      'start': instance.start,
      'end': instance.end,
    };
