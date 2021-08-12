// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvisioningId _$ProvisioningIdFromJson(Map<String, dynamic> json) =>
    ProvisioningId(
      deviceId: json['device_id'] as String,
      expiredAt: json['expired_at'] == null
          ? null
          : DateTime.parse(json['expired_at'] as String),
    );

Map<String, dynamic> _$ProvisioningIdToJson(ProvisioningId instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'expired_at': instance.expiredAt?.toIso8601String(),
    };
