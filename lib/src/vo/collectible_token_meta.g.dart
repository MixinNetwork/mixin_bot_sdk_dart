// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectible_token_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectibleTokenMeta _$CollectibleTokenMetaFromJson(
        Map<String, dynamic> json) =>
    CollectibleTokenMeta(
      json['group'] as String,
      json['name'] as String,
      json['description'] as String,
      json['icon_url'] as String,
      json['media_url'] as String,
      json['mime'] as String,
      json['hash'] as String,
    );

Map<String, dynamic> _$CollectibleTokenMetaToJson(
        CollectibleTokenMeta instance) =>
    <String, dynamic>{
      'group': instance.group,
      'name': instance.name,
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'media_url': instance.mediaUrl,
      'mime': instance.mime,
      'hash': instance.hash,
    };
