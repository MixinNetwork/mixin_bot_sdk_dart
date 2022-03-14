// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationResponse _$VerificationResponseFromJson(
        Map<String, dynamic> json) =>
    VerificationResponse(
      type: json['type'] as String,
      id: json['id'] as String,
      hasEmergencyContact: json['has_emergency_contact'] as bool? ?? false,
      contactId: json['contact_id'] as String?,
    );

Map<String, dynamic> _$VerificationResponseToJson(
        VerificationResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'has_emergency_contact': instance.hasEmergencyContact,
      'contact_id': instance.contactId,
    };
