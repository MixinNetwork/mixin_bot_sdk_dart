// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provisioning _$ProvisioningFromJson(Map<String, dynamic> json) => Provisioning(
  deviceId: json['device_id'] as String,
  expiredAt: json['expired_at'] == null
      ? null
      : DateTime.parse(json['expired_at'] as String),
  secret: json['secret'] as String,
  platform: json['platform'] as String?,
  provisioningCode: json['provisioning_code'] as String?,
  sessionId: json['session_id'] as String?,
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$ProvisioningToJson(Provisioning instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'expired_at': instance.expiredAt?.toIso8601String(),
      'secret': instance.secret,
      'platform': instance.platform,
      'provisioning_code': instance.provisioningCode,
      'session_id': instance.sessionId,
      'user_id': instance.userId,
    };
