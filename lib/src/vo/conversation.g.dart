// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversation _$ConversationFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'conversation_id',
    'category',
    'created_at',
    'status'
  ]);
  return Conversation(
    conversationId: json['conversation_id'] as String,
    name: json['name'] as String?,
    ownerId: json['owner_id'] as String?,
    category: const ConversationCategoryJsonConverter()
        .fromJson(json['category'] as String?),
    announcement: json['announcement'] as String?,
    iconUrl: json['icon_url'] as String?,
    createdAt: DateTime.parse(json['created_at'] as String),
    pinedAt: json['pin_time'] == null
        ? null
        : DateTime.parse(json['pin_time'] as String),
    lastMessageId: json['last_message_id'] as String?,
    lastReadMessageId: json['last_read_message_id'] as String?,
    unseenMessageCount: json['unseen_message_count'] as int?,
    status: _$enumDecode(_$ConversationStatusEnumMap, json['status']),
    draft: json['draft'] as String?,
    muteUntil: json['mute_until'] as String?,
  );
}

Map<String, dynamic> _$ConversationToJson(Conversation instance) {
  final val = <String, dynamic>{
    'conversation_id': instance.conversationId,
    'owner_id': instance.ownerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category',
      const ConversationCategoryJsonConverter().toJson(instance.category));
  val['name'] = instance.name;
  val['announcement'] = instance.announcement;
  val['icon_url'] = instance.iconUrl;
  val['created_at'] = instance.createdAt.toIso8601String();
  val['pin_time'] = instance.pinedAt?.toIso8601String();
  val['last_message_id'] = instance.lastMessageId;
  val['last_read_message_id'] = instance.lastReadMessageId;
  val['unseen_message_count'] = instance.unseenMessageCount;
  val['status'] = _$ConversationStatusEnumMap[instance.status];
  val['draft'] = instance.draft;
  val['mute_until'] = instance.muteUntil;
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ConversationStatusEnumMap = {
  ConversationStatus.start: 'start',
  ConversationStatus.failure: 'failure',
  ConversationStatus.success: 'success',
  ConversationStatus.quit: 'quit',
};
