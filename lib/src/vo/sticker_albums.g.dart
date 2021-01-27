// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerAlbum _$StickerAlbumFromJson(Map<String, dynamic> json) {
  return StickerAlbum(
    json['album_id'] as String,
    json['name'] as String,
    json['icon_url'] as String,
    DateTime.parse(json['created_at'] as String),
    DateTime.parse(json['update_at'] as String),
    json['user_id'] as String,
    json['category'] as String,
    json['description'] as String,
  );
}

Map<String, dynamic> _$StickerAlbumToJson(StickerAlbum instance) =>
    <String, dynamic>{
      'album_id': instance.albumId,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'update_at': instance.updateAt.toIso8601String(),
      'user_id': instance.userId,
      'category': instance.category,
      'description': instance.description,
    };
