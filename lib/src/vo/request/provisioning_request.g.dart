// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvisioningRequest _$ProvisioningRequestFromJson(Map<String, dynamic> json) {
  return ProvisioningRequest(
    userId: json['user_id'] as String,
    sessionId: json['session_id'] as String,
    sessionSecret: json['session_secret'] as String,
    code: json['code'] as String,
    platform: json['platform'] as String,
    platformVersion: json['platform_version'] as String,
    appVersion: json['app_version'] as String,
    purpose: json['purpose'] as String,
    registrationId: json['registration_id'] as int,
  );
}

Map<String, dynamic> _$ProvisioningRequestToJson(
        ProvisioningRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'session_secret': instance.sessionSecret,
      'code': instance.code,
      'platform': instance.platform,
      'platform_version': instance.platformVersion,
      'app_version': instance.appVersion,
      'purpose': instance.purpose,
      'registration_id': instance.registrationId,
    };
