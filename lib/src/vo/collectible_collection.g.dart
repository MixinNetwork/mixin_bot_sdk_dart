// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectible_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectibleCollection _$CollectibleCollectionFromJson(
        Map<String, dynamic> json) =>
    CollectibleCollection(
      type: json['type'] as String,
      collectionId: json['collection_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      iconUrl: json['icon_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CollectibleCollectionToJson(
        CollectibleCollection instance) =>
    <String, dynamic>{
      'type': instance.type,
      'collection_id': instance.collectionId,
      'name': instance.name,
      'description': instance.description,
      'icon_url': instance.iconUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };
