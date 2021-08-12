// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oauth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OauthResponse _$OauthResponseFromJson(Map<String, dynamic> json) =>
    OauthResponse(
      accessToken: json['access_token'] as String,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$OauthResponseToJson(OauthResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'scope': instance.scope,
    };
