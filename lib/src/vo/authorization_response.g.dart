// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationResponse _$AuthorizationResponseFromJson(
  Map<String, dynamic> json,
) => AuthorizationResponse(
  json['authorization_id'] as String,
  json['authorization_code'] as String,
  (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
  json['code_id'] as String,
  App.fromJson(json['app'] as Map<String, dynamic>),
  json['created_at'] as String,
  json['accessed_at'] as String,
);

Map<String, dynamic> _$AuthorizationResponseToJson(
  AuthorizationResponse instance,
) => <String, dynamic>{
  'authorization_id': instance.authorizationId,
  'authorization_code': instance.authorizationCode,
  'scopes': instance.scopes,
  'code_id': instance.codeId,
  'app': instance.app,
  'created_at': instance.createdAt,
  'accessed_at': instance.accessedAt,
};
