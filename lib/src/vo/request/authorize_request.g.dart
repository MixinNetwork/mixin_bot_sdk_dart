// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorize_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizeRequest _$AuthorizeRequestFromJson(Map<String, dynamic> json) =>
    AuthorizeRequest(
      authorizationId: json['authorization_id'] as String,
      scopes:
          (json['scopes'] as List<dynamic>).map((e) => e as String).toList(),
      pin: json['pin_base64'] as String?,
    );

Map<String, dynamic> _$AuthorizeRequestToJson(AuthorizeRequest instance) =>
    <String, dynamic>{
      'authorization_id': instance.authorizationId,
      'scopes': instance.scopes,
      'pin_base64': instance.pin,
    };
