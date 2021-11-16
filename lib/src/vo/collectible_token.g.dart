// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectible_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectibleToken _$CollectibleTokenFromJson(Map<String, dynamic> json) =>
    CollectibleToken(
      json['type'] as String,
      json['token_id'] as String,
      json['group'] as String,
      json['token'] as String,
      json['mixin_id'] as String,
      json['nfo'] as String,
      CollectibleTokenMeta.fromJson(json['meta'] as Map<String, dynamic>),
      json['created_at'] as String,
    );

Map<String, dynamic> _$CollectibleTokenToJson(CollectibleToken instance) =>
    <String, dynamic>{
      'type': instance.type,
      'token_id': instance.tokenId,
      'group': instance.group,
      'token': instance.token,
      'mixin_id': instance.mixinId,
      'nfo': instance.nfo,
      'meta': instance.meta,
      'created_at': instance.createdAt,
    };
