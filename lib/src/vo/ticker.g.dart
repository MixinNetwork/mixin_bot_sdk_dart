// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) {
  return Ticker(
    priceUsd: json['price_usd'] as String,
    priceBtc: json['price_btc'] as String,
  );
}

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'price_usd': instance.priceUsd,
      'price_btc': instance.priceBtc,
    };
