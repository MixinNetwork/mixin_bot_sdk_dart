// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
  chainId: json['chain_id'] as String,
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  iconUrl: json['icon_url'] as String,
  threshold: (json['threshold'] as num).toInt(),
);

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
  'chain_id': instance.chainId,
  'name': instance.name,
  'symbol': instance.symbol,
  'icon_url': instance.iconUrl,
  'threshold': instance.threshold,
};
