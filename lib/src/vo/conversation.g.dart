// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) => Conversation(
      conversationId: json['conversation_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      status: const ConversationStatusJsonConverter()
          .fromJson(json['status'] as int?),
      name: json['name'] as String?,
      ownerId: json['owner_id'] as String?,
      category: const ConversationCategoryJsonConverter()
          .fromJson(json['category'] as String?),
      announcement: json['announcement'] as String?,
      iconUrl: json['icon_url'] as String?,
      pinedAt: json['pin_time'] == null
          ? null
          : DateTime.parse(json['pin_time'] as String),
      lastMessageId: json['last_message_id'] as String?,
      lastReadMessageId: json['last_read_message_id'] as String?,
      unseenMessageCount: json['unseen_message_count'] as int?,
      draft: json['draft'] as String?,
      muteUntil: json['mute_until'] as String?,
    );

Map<String, dynamic> _$ConversationToJson(Conversation instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'owner_id': instance.ownerId,
      'category':
          const ConversationCategoryJsonConverter().toJson(instance.category),
      'name': instance.name,
      'announcement': instance.announcement,
      'icon_url': instance.iconUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'pin_time': instance.pinedAt?.toIso8601String(),
      'last_message_id': instance.lastMessageId,
      'last_read_message_id': instance.lastReadMessageId,
      'unseen_message_count': instance.unseenMessageCount,
      'status': const ConversationStatusJsonConverter().toJson(instance.status),
      'draft': instance.draft,
      'mute_until': instance.muteUntil,
    };
