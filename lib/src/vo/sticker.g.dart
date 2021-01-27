// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sticker _$StickerFromJson(Map<String, dynamic> json) {
  return Sticker(
    json['sticker_id'] as String,
    json['album_id'] as String,
    json['name'] as String,
    json['asset_url'] as String,
    json['asset_type'] as String,
    json['asset_width'] as int,
    json['asset_height'] as int,
    json['created_at'] as String,
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
      'created_at': instance.createdAt,
    };
