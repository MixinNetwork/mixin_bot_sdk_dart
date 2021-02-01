// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    userId: json['user_id'] as String,
    identityNumber: json['identity_number'] as String,
    relationship: _$enumDecode(_$UserRelationshipEnumMap, json['relationship']),
    biography: json['biography'] as String,
    fullName: json['full_name'] as String,
    avatarUrl: json['avatar_url'] as String,
    phone: json['phone'] as String,
    isVerified: json['is_verified'] as bool,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    muteUntil: json['mute_until'] as String,
    hasPin: json['has_pin'] as bool,
    app: json['app'] == null
        ? null
        : App.fromJson(json['app'] as Map<String, dynamic>),
    appId: json['app_id'] as String,
    isScam: json['is_scam'] as bool,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'identity_number': instance.identityNumber,
      'relationship': _$UserRelationshipEnumMap[instance.relationship],
      'biography': instance.biography,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'phone': instance.phone,
      'is_verified': instance.isVerified,
      'created_at': instance.createdAt?.toIso8601String(),
      'mute_until': instance.muteUntil,
      'has_pin': instance.hasPin,
      'app': instance.app,
      'app_id': instance.appId,
      'is_scam': instance.isScam,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

const _$UserRelationshipEnumMap = {
  UserRelationship.friend: 'FRIEND',
  UserRelationship.me: 'ME',
  UserRelationship.stranger: 'STRANGER',
  UserRelationship.blocking: 'BLOCKING',
};
