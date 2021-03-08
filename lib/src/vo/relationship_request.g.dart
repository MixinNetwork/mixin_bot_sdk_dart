// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipRequest _$RelationshipRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['user_id', 'action']);
  return RelationshipRequest(
    userId: json['user_id'] as String,
    action: json['action'] as String,
    fullName: json['full_name'] as String?,
  );
}

Map<String, dynamic> _$RelationshipRequestToJson(
        RelationshipRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'action': instance.action,
      'full_name': instance.fullName,
    };
