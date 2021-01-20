// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationResponse _$ConversationResponseFromJson(Map<String, dynamic> json) {
  return ConversationResponse(
    conversationId: json['conversation_id'] as String,
    name: json['name'] as String,
    category: _$enumDecode(_$ConversationCategoryEnumMap, json['category']),
    iconUrl: json['icon_url'] as String,
    codeUrl: json['code_url'] as String,
    createdAt: DateTime.parse(json['created_at'] as String),
    participants: (json['participants'] as List)
        .map((e) => ParticipantRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
    participantSessions: (json['participant_sessions'] as List)
        ?.map((e) =>
            e == null ? null : UserSession.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    circles: (json['circles'] as List)
        ?.map((e) => e == null
            ? null
            : CircleConversation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    muteUntil: json['mute_until'] as String,
  )
    ..creatorId = json['creator_id'] as String
    ..announcement = json['announcement'] as String;
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

const _$ConversationCategoryEnumMap = {
  ConversationCategory.contact: 'CONTACT',
  ConversationCategory.group: 'GROUP',
};
