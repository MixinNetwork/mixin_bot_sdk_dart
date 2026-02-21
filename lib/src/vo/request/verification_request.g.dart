// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationRequest _$VerificationRequestFromJson(Map<String, dynamic> json) =>
    VerificationRequest(
      phone: json['phone'] as String?,
      purpose: $enumDecodeNullable(
        _$VerificationPurposeEnumMap,
        json['purpose'],
      ),
      gRecaptchaResponse: json['g_recaptcha_response'] as String?,
      hCaptchaResponse: json['g_recaptcha_token'] as String?,
      packageName: json['package_name'] as String?,
    );

Map<String, dynamic> _$VerificationRequestToJson(
  VerificationRequest instance,
) => <String, dynamic>{
  'phone': instance.phone,
  'purpose': _$VerificationPurposeEnumMap[instance.purpose],
  'g_recaptcha_response': instance.gRecaptchaResponse,
  'g_recaptcha_token': instance.hCaptchaResponse,
  'package_name': instance.packageName,
};

const _$VerificationPurposeEnumMap = {
  VerificationPurpose.session: 'SESSION',
  VerificationPurpose.phone: 'PHONE',
  VerificationPurpose.deactivated: 'DEACTIVATED',
};
