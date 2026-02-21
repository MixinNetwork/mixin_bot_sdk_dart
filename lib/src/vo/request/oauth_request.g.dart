// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthRequest _$OauthRequestFromJson(Map<String, dynamic> json) => OauthRequest(
  json['client_id'] as String,
  json['client_secret'] as String,
  json['code'] as String,
);

Map<String, dynamic> _$OauthRequestToJson(OauthRequest instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'code': instance.code,
    };
