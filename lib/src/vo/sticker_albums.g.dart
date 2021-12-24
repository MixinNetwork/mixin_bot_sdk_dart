// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_albums.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StickerAlbum _$StickerAlbumFromJson(Map<String, dynamic> json) => StickerAlbum(
      albumId: json['album_id'] as String,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updateAt: DateTime.parse(json['update_at'] as String),
      userId: json['user_id'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      banner: json['banner'] as String?,
    );

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
      'banner': instance.banner,
    };
