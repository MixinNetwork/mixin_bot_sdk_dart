// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deactivate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeactivateRequest _$DeactivateRequestFromJson(Map<String, dynamic> json) =>
    DeactivateRequest(
      json['pin_base64'] as String,
      json['verification_id'] as String,
    );

Map<String, dynamic> _$DeactivateRequestToJson(DeactivateRequest instance) =>
    <String, dynamic>{
      'pin_base64': instance.pin,
      'verification_id': instance.verificationId,
    };
