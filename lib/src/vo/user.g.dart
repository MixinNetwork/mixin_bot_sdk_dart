// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userId: json['user_id'] as String,
      identityNumber: json['identity_number'] as String,
      relationship: const UserRelationshipJsonConverter()
          .fromJson(json['relationship'] as String?),
      biography: json['biography'] as String,
      isVerified: json['is_verified'] as bool,
      muteUntil: json['mute_until'] as String,
      isScam: json['is_scam'] as bool,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      hasPin: json['has_pin'] as bool?,
      app: json['app'] == null
          ? null
          : App.fromJson(json['app'] as Map<String, dynamic>),
      appId: json['app_id'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'identity_number': instance.identityNumber,
      'relationship':
          const UserRelationshipJsonConverter().toJson(instance.relationship),
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
