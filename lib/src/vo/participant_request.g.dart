// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantRequest _$ParticipantRequestFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const ['user_id']);
  return ParticipantRequest(
    userId: json['user_id'] as String,
    role: _$enumDecode(_$ParticipantRoleEnumMap, json['role']),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
  );
}

Map<String, dynamic> _$ParticipantRequestToJson(ParticipantRequest instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'role': _$ParticipantRoleEnumMap[instance.role],
      'created_at': instance.createdAt?.toIso8601String(),
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

const _$ParticipantRoleEnumMap = {
  ParticipantRole.owner: 'owner',
  ParticipantRole.admin: 'admin',
};
