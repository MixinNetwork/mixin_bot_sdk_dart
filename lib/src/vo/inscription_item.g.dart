// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inscription_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InscriptionItem _$InscriptionItemFromJson(Map<String, dynamic> json) =>
    InscriptionItem(
      inscriptionHash: json['inscription_hash'] as String,
      collectionHash: json['collection_hash'] as String,
      sequence: (json['sequence'] as num).toInt(),
      contentType: json['content_type'] as String,
      contentURL: json['content_url'] as String,
      occupiedBy: json['occupied_by'] as String?,
      occupiedAt: json['occupied_at'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$InscriptionItemToJson(InscriptionItem instance) =>
    <String, dynamic>{
      'inscription_hash': instance.inscriptionHash,
      'collection_hash': instance.collectionHash,
      'sequence': instance.sequence,
      'content_type': instance.contentType,
      'content_url': instance.contentURL,
      'occupied_by': instance.occupiedBy,
      'occupied_at': instance.occupiedAt,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
