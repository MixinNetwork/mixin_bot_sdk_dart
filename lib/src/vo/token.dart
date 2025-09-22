import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token with EquatableMixin {
  Token({
    required this.assetId,
    required this.asset,
    required this.symbol,
    required this.name,
    required this.displaySymbol,
    required this.displayName,
    required this.iconUrl,
    required this.priceBtc,
    required this.priceUsd,
    required this.chainId,
    required this.changeUsd,
    required this.changeBtc,
    required this.confirmations,
    required this.assetKey,
    required this.precision,
    required this.dust,
    required this.level,
    this.collectionHash,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  @JsonKey(name: 'asset_id')
  final String assetId;
  @JsonKey(name: 'kernel_asset_id')
  final String asset;
  @JsonKey(name: 'symbol')
  final String symbol;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'display_symbol')
  final String displaySymbol;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'icon_url')
  final String iconUrl;
  @JsonKey(name: 'price_btc')
  final String priceBtc;
  @JsonKey(name: 'price_usd')
  final String priceUsd;
  @JsonKey(name: 'chain_id')
  final String chainId;
  @JsonKey(name: 'change_usd')
  final String changeUsd;
  @JsonKey(name: 'change_btc')
  final String changeBtc;
  @JsonKey(name: 'confirmations')
  final int confirmations;
  @JsonKey(name: 'asset_key')
  final String assetKey;
  @JsonKey(name: 'precision')
  final int precision;
  @JsonKey(name: 'dust')
  final String dust;
  @JsonKey(name: 'level')
  final int level;
  @JsonKey(name: 'collection_hash')
  final String? collectionHash;

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  @override
  List<Object?> get props => [
        assetId,
        asset,
        symbol,
        name,
        displaySymbol,
        displayName,
        iconUrl,
        priceBtc,
        priceUsd,
        chainId,
        changeUsd,
        changeBtc,
        confirmations,
        assetKey,
        precision,
        dust,
        level,
        collectionHash,
      ];
}
