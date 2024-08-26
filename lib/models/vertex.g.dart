// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDto _$MessageDtoFromJson(Map<String, dynamic> json) => MessageDto(
      json['error'] as bool,
      json['message'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
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
      json['start'] as Map<String, dynamic>,
      json['end'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$VertexDtoToJson(VertexDto instance) => <String, dynamic>{
      'id': instance.id,
      'field': instance.field,
      'start': instance.start,
      'end': instance.end,
    };

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      (json['data'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['id'] as String,
      json['result'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'result': instance.result,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      (json['steps'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      json['path'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'steps': instance.steps,
      'path': instance.path,
    };
