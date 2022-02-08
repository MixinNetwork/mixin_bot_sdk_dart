// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle_conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleConversationRequest _$CircleConversationRequestFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    disallowNullValues: const ['conversation_id', 'action', 'user_id'],
  );
  return CircleConversationRequest(
    conversationId: json['conversation_id'] as String,
    action: $enumDecode(_$CircleConversationActionEnumMap, json['action']),
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

const _$CircleConversationActionEnumMap = {
  CircleConversationAction.add: 'ADD',
  CircleConversationAction.remove: 'REMOVE',
};
