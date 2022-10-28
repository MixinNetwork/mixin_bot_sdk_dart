// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutputRequest _$OutputRequestFromJson(Map<String, dynamic> json) =>
    OutputRequest(
      receivers:
          (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      index: json['index'] as int,
      hint: json['hint'] as String?,
    );

Map<String, dynamic> _$OutputRequestToJson(OutputRequest instance) =>
    <String, dynamic>{
      'receivers': instance.receivers,
      'index': instance.index,
      'hint': instance.hint,
    };
