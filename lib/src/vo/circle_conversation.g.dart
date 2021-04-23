// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleConversation _$CircleConversationFromJson(Map<String, dynamic> json) {
  return CircleConversation(
    conversationId: json['conversation_id'] as String,
    circleId: json['circle_id'] as String,
    userId: json['user_id'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
    pinTime: json['pinTime'] as String,
  );
}

Map<String, dynamic> _$CircleConversationToJson(CircleConversation instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'circle_id': instance.circleId,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
      'pinTime': instance.pinTime,
    };
