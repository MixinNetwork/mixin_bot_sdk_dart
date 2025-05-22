// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      assetId: json['asset_id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      displaySymbol: json['display_symbol'] as String,
      displayName: json['display_name'] as String,
      iconUrl: json['icon_url'] as String,
      balance: json['balance'] as String,
      priceBtc: json['price_btc'] as String,
      priceUsd: json['price_usd'] as String,
      chainId: json['chain_id'] as String,
      changeBtc: json['change_btc'] as String,
      changeUsd: json['change_usd'] as String,
      confirmations: (json['confirmations'] as num).toInt(),
      feeAssetId: json['fee_asset_id'] as String?,
      precision: (json['precision'] as num).toInt(),
      tag: json['tag'] as String?,
      assetKey: json['asset_key'] as String?,
      reserve: json['reserve'] as String?,
      depositEntries: (json['deposit_entries'] as List<dynamic>?)
          ?.map((e) => DepositEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'asset_id': instance.assetId,
      'symbol': instance.symbol,
      'name': instance.name,
      'display_symbol': instance.displaySymbol,
      'display_name': instance.displayName,
      'icon_url': instance.iconUrl,
      'balance': instance.balance,
      'tag': instance.tag,
      'price_btc': instance.priceBtc,
      'price_usd': instance.priceUsd,
      'chain_id': instance.chainId,
      'change_usd': instance.changeUsd,
      'change_btc': instance.changeBtc,
      'confirmations': instance.confirmations,
      'asset_key': instance.assetKey,
      'reserve': instance.reserve,
      'deposit_entries': instance.depositEntries,
      'fee_asset_id': instance.feeAssetId,
      'precision': instance.precision,
    };
