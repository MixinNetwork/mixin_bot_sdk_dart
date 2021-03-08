// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationResponse _$ConversationResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'conversation_id',
    'name',
    'category',
    'creator_id',
    'icon_url',
    'code_url',
    'announcement',
    'created_at',
    'participants',
    'mute_until'
  ]);
  return ConversationResponse(
    conversationId: json['conversation_id'] as String,
    name: json['name'] as String,
    category: _$enumDecode(_$ConversationCategoryEnumMap, json['category']),
    iconUrl: json['icon_url'] as String,
    codeUrl: json['code_url'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    participants: (json['participants'] as List<dynamic>)
        .map((e) => ParticipantRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
    participantSessions: (json['participant_sessions'] as List<dynamic>?)
        ?.map((e) => UserSession.fromJson(e as Map<String, dynamic>))
        .toList(),
    circles: (json['circles'] as List<dynamic>?)
        ?.map((e) => CircleConversation.fromJson(e as Map<String, dynamic>))
        .toList(),
    muteUntil: json['mute_until'] as String,
    announcement: json['announcement'] as String,
    creatorId: json['creator_id'] as String,
  );
}

Map<String, dynamic> _$ConversationResponseToJson(
        ConversationResponse instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'name': instance.name,
      'category': _$ConversationCategoryEnumMap[instance.category],
      'creator_id': instance.creatorId,
      'icon_url': instance.iconUrl,
      'code_url': instance.codeUrl,
      'announcement': instance.announcement,
      'created_at': instance.createdAt.toIso8601String(),
      'participants': instance.participants,
      'participant_sessions': instance.participantSessions,
      'circles': instance.circles,
      'mute_until': instance.muteUntil,
    };

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

const _$ConversationCategoryEnumMap = {
  ConversationCategory.contact: 'contact',
  ConversationCategory.group: 'group',
};
