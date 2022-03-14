// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRequest _$AccountRequestFromJson(Map<String, dynamic> json) =>
    AccountRequest(
      platform: json['platform'] as String,
      platformVersion: json['platform_version'] as String,
      appVersion: json['app_version'] as String,
      packageName: json['package_name'] as String,
      purpose: $enumDecode(_$VerificationPurposeEnumMap, json['purpose']),
      code: json['code'] as String?,
      notificationToken: json['notification_token'] as String?,
      registrationId: json['registration_id'] as int?,
      pin: json['pin'] as String?,
      sessionSecret: json['session_secret'] as String?,
    );

Map<String, dynamic> _$AccountRequestToJson(AccountRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'notification_token': instance.notificationToken,
      'registration_id': instance.registrationId,
      'platform': instance.platform,
      'platform_version': instance.platformVersion,
      'app_version': instance.appVersion,
      'package_name': instance.packageName,
      'purpose': _$VerificationPurposeEnumMap[instance.purpose],
      'pin': instance.pin,
      'session_secret': instance.sessionSecret,
    };

const _$VerificationPurposeEnumMap = {
  VerificationPurpose.session: 'SESSION',
  VerificationPurpose.phone: 'PHONE',
};
