// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleResponse _$CircleResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['circle_id', 'name', 'created_at'],
  );
  return CircleResponse(
    circleId: json['circle_id'] as String,
    name: json['name'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$CircleResponseToJson(CircleResponse instance) =>
    <String, dynamic>{
      'circle_id': instance.circleId,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
    };
