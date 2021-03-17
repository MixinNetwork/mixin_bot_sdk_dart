// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
    stickerId: json['sticker_id'] as String,
    albumId: json['album_id'] as String?,
    name: json['name'] as String,
    assetUrl: json['asset_url'] as String,
    assetType: json['asset_type'] as String,
    assetWidth: json['asset_width'] as int,
    assetHeight: json['asset_height'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    lastUsedAt: json['last_use_at'] == null
        ? null
        : DateTime.parse(json['last_use_at'] as String),
  );
}

Map<String, dynamic> _$StickerToJson(Sticker instance) => <String, dynamic>{
      'sticker_id': instance.stickerId,
      'album_id': instance.albumId,
      'name': instance.name,
      'asset_url': instance.assetUrl,
      'asset_type': instance.assetType,
      'asset_width': instance.assetWidth,
      'asset_height': instance.assetHeight,
      'created_at': instance.createdAt.toIso8601String(),
      'last_use_at': instance.lastUsedAt?.toIso8601String(),
    };
