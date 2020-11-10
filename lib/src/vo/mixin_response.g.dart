// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixinResponse _$MixinResponseFromJson(Map<String, dynamic> json) {
  return MixinResponse(
    json['error'] == null
        ? null
        : MixinError.fromJson(json['error'] as Map<String, dynamic>),
    json['data'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$MixinResponseToJson(MixinResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };
