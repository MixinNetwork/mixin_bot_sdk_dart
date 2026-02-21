// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixin_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixinError _$MixinErrorFromJson(Map<String, dynamic> json) => MixinError(
  (json['status'] as num?)?.toInt(),
  (json['code'] as num?)?.toInt() ?? 0,
  json['description'] as String? ?? '',
);

Map<String, dynamic> _$MixinErrorToJson(MixinError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'description': instance.description,
    };
