// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ghost_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GhostKey _$GhostKeyFromJson(Map<String, dynamic> json) => GhostKey(
      json['type'] as String,
      json['mask'] as String,
      (json['keys'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GhostKeyToJson(GhostKey instance) => <String, dynamic>{
      'type': instance.type,
      'mask': instance.mask,
      'keys': instance.keys,
    };

SafeGhostKey _$SafeGhostKeyFromJson(Map<String, dynamic> json) => SafeGhostKey(
      mask: json['mask'] as String,
      keys: (json['keys'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$SafeGhostKeyToJson(SafeGhostKey instance) =>
    <String, dynamic>{
      'mask': instance.mask,
      'keys': instance.keys,
    };
