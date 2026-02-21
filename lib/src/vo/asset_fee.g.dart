// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssetFee _$AssetFeeFromJson(Map<String, dynamic> json) => AssetFee(
  type: json['type'] as String,
  assetId: json['asset_id'] as String,
  amount: json['amount'] as String,
);

Map<String, dynamic> _$AssetFeeToJson(AssetFee instance) => <String, dynamic>{
  'type': instance.type,
  'asset_id': instance.assetId,
  'amount': instance.amount,
};
