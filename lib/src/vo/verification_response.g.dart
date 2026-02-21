// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationResponse _$VerificationResponseFromJson(
  Map<String, dynamic> json,
) => VerificationResponse(
  type: json['type'] as String,
  id: json['id'] as String,
  hasEmergencyContact: json['has_emergency_contact'] as bool? ?? false,
  contactId: json['contact_id'] as String?,
  deactivationEffectiveAt: json['deactivation_effective_at'] == null
      ? null
      : DateTime.parse(json['deactivation_effective_at'] as String),
  deactivationRequestedAt: json['deactivation_requested_at'] == null
      ? null
      : DateTime.parse(json['deactivation_requested_at'] as String),
);

Map<String, dynamic> _$VerificationResponseToJson(
  VerificationResponse instance,
) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'has_emergency_contact': instance.hasEmergencyContact,
  'contact_id': instance.contactId,
  'deactivation_requested_at': instance.deactivationRequestedAt
      ?.toIso8601String(),
  'deactivation_effective_at': instance.deactivationEffectiveAt
      ?.toIso8601String(),
};
