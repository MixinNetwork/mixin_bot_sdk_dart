// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSession _$UserSessionFromJson(Map<String, dynamic> json) {
  return UserSession(
    json['user_id'] as String,
    json['session_id'] as String,
    json['platform'] as String,
    json['public_key'] as String,
  );
}

Map<String, dynamic> _$UserSessionToJson(UserSession instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'platform': instance.platform,
      'public_key': instance.publicKey,
    };
