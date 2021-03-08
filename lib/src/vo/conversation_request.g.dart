// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationRequest _$ConversationRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['conversation_id', 'name']);
  return ConversationRequest(
    conversationId: json['conversation_id'] as String,
    category: const ConversationCategoryJsonConverter()
        .fromJson(json['category'] as String?),
    name: json['name'] as String?,
    iconBase64: json['icon_base64'] as String?,
    announcement: json['announcement'] as String?,
    participants: (json['participants'] as List<dynamic>?)
        ?.map((e) => ParticipantRequest.fromJson(e as Map<String, dynamic>))
        .toList(),
    duration: json['duration'] as int?,
  );
}

Map<String, dynamic> _$ConversationRequestToJson(ConversationRequest instance) {
  final val = <String, dynamic>{
    'conversation_id': instance.conversationId,
    'category':
        const ConversationCategoryJsonConverter().toJson(instance.category),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  val['icon_base64'] = instance.iconBase64;
  val['announcement'] = instance.announcement;
  val['participants'] = instance.participants;
  val['duration'] = instance.duration;
  return val;
}
