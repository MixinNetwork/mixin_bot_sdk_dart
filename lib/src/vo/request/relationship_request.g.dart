// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipRequest _$RelationshipRequestFromJson(Map<String, dynamic> json) =>
    RelationshipRequest(
      userId: json['user_id'] as String,
      action: const RelationshipActionJsonConverter()
          .fromJson(json['action'] as String?),
      fullName: json['full_name'] as String?,
    );

Map<String, dynamic> _$RelationshipRequestToJson(
        RelationshipRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'action': const RelationshipActionJsonConverter().toJson(instance.action),
      'full_name': instance.fullName,
    };
