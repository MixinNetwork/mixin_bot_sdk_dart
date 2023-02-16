// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_precision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetPrecision _$AssetPrecisionFromJson(Map<String, dynamic> json) =>
    AssetPrecision(
      assetId: json['asset_id'] as String,
      chainId: json['chain_id'] as String,
      precision: json['precision'] as int,
    );

Map<String, dynamic> _$AssetPrecisionToJson(AssetPrecision instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'chain_id': instance.chainId,
      'precision': instance.precision,
    };
