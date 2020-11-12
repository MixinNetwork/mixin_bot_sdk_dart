// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Provisioning _$ProvisioningFromJson(Map<String, dynamic> json) {
  return Provisioning(
    deviceId: json['device_id'] as String,
    expiredAt: json['expired_at'] as String,
  );
}

Map<String, dynamic> _$ProvisioningToJson(Provisioning instance) =>
    <String, dynamic>{
      'device_id': instance.deviceId,
      'expired_at': instance.expiredAt,
    };
