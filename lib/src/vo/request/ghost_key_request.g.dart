// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ghost_key_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GhostKeyRequest _$GhostKeyRequestFromJson(Map<String, dynamic> json) =>
    GhostKeyRequest(
      receivers:
          (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
      index: (json['index'] as num).toInt(),
      hint: json['hint'] as String,
    );

Map<String, dynamic> _$GhostKeyRequestToJson(GhostKeyRequest instance) =>
    <String, dynamic>{
      'receivers': instance.receivers,
      'index': instance.index,
      'hint': instance.hint,
    };
