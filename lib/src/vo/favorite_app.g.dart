// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_app.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteApp _$FavoriteAppFromJson(Map<String, dynamic> json) => FavoriteApp(
      json['app_id'] as String,
      json['user_id'] as String,
      DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$FavoriteAppToJson(FavoriteApp instance) =>
    <String, dynamic>{
      'app_id': instance.appId,
      'user_id': instance.userId,
      'created_at': instance.createdAt.toIso8601String(),
    };
