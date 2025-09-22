// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      assetId: json['asset_id'] as String,
      asset: json['kernel_asset_id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      displaySymbol: json['display_symbol'] as String,
      displayName: json['display_name'] as String,
      iconUrl: json['icon_url'] as String,
      priceBtc: json['price_btc'] as String,
      priceUsd: json['price_usd'] as String,
      chainId: json['chain_id'] as String,
      changeUsd: json['change_usd'] as String,
      changeBtc: json['change_btc'] as String,
      confirmations: (json['confirmations'] as num).toInt(),
      assetKey: json['asset_key'] as String,
      precision: (json['precision'] as num).toInt(),
      dust: json['dust'] as String,
      level: (json['level'] as num).toInt(),
      collectionHash: json['collection_hash'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'asset_id': instance.assetId,
      'kernel_asset_id': instance.asset,
      'symbol': instance.symbol,
      'name': instance.name,
      'display_symbol': instance.displaySymbol,
      'display_name': instance.displayName,
      'icon_url': instance.iconUrl,
      'price_btc': instance.priceBtc,
      'price_usd': instance.priceUsd,
      'chain_id': instance.chainId,
      'change_usd': instance.changeUsd,
      'change_btc': instance.changeBtc,
      'confirmations': instance.confirmations,
      'asset_key': instance.assetKey,
      'precision': instance.precision,
      'dust': instance.dust,
      'level': instance.level,
      'collection_hash': instance.collectionHash,
    };
