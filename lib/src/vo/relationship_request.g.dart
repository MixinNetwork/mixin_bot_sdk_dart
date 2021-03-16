// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipRequest _$RelationshipRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['user_id', 'action']);
  return RelationshipRequest(
    userId: json['user_id'] as String,
    action: _$enumDecode(_$RelationshipActionEnumMap, json['action']),
    fullName: json['full_name'] as String?,
  );
}

Map<String, dynamic> _$RelationshipRequestToJson(
        RelationshipRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'action': _$RelationshipActionEnumMap[instance.action],
      'full_name': instance.fullName,
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

const _$RelationshipActionEnumMap = {
  RelationshipAction.add: 'add',
  RelationshipAction.remove: 'remove',
  RelationshipAction.block: 'block',
  RelationshipAction.unblock: 'unblock',
};
