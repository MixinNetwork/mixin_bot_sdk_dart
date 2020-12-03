// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixin_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixinError _$MixinErrorFromJson(Map<String, dynamic> json) {
  return MixinError(
    json['status'] as int,
    json['code'] as int,
    json['description'] as String,
  );
}

Map<String, dynamic> _$MixinErrorToJson(MixinError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'description': instance.description,
    };
