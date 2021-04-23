// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleConversationRequest _$CircleConversationRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json,
      disallowNullValues: const ['conversation_id', 'action', 'user_id']);
  return CircleConversationRequest(
    conversationId: json['conversation_id'] as String,
    action: _$enumDecode(_$CircleConversationActionEnumMap, json['action']),
    userId: json['user_id'] as String?,
  );
}

Map<String, dynamic> _$CircleConversationRequestToJson(
    CircleConversationRequest instance) {
  final val = <String, dynamic>{
    'conversation_id': instance.conversationId,
    'action': _$CircleConversationActionEnumMap[instance.action],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
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

const _$CircleConversationActionEnumMap = {
  CircleConversationAction.ADD: 'ADD',
  CircleConversationAction.REMOVE: 'REMOVE',
};
