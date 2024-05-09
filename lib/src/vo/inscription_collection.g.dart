// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inscription_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InscriptionCollection _$InscriptionCollectionFromJson(
        Map<String, dynamic> json) =>
    InscriptionCollection(
      collectionHash: json['collection_hash'] as String,
      supply: json['supply'] as String,
      unit: json['unit'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$InscriptionCollectionToJson(
        InscriptionCollection instance) =>
    <String, dynamic>{
      'collection_hash': instance.collectionHash,
      'supply': instance.supply,
      'unit': instance.unit,
      'symbol': instance.symbol,
      'name': instance.name,
      'icon_url': instance.iconUrl,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
