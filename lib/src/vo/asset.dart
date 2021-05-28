import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset with EquatableMixin {
  @JsonKey(name: 'asset_id')
  String assetId;
  @JsonKey(name: 'symbol')
  String symbol;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'icon_url')
  String iconUrl;
  @JsonKey(name: 'balance')
  String balance;
  @JsonKey(name: 'destination')
  String destination;
  @JsonKey(name: 'tag')
  String? tag;
  @JsonKey(name: 'price_btc')
  String priceBtc;
  @JsonKey(name: 'price_usd')
  String priceUsd;
  @JsonKey(name: 'chain_id')
  String chainId;
  @JsonKey(name: 'change_usd')
  String changeUsd;
  @JsonKey(name: 'change_btc')
  String changeBtc;
  @JsonKey(name: 'confirmations')
  int confirmations;
  @JsonKey(name: 'asset_key')
  String? assetKey;
  @JsonKey(name: 'reserve')
  String? reserve;

  Asset({
    required this.assetId,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.balance,
    required this.destination,
    this.tag,
    required this.priceBtc,
    required this.priceUsd,
    required this.chainId,
    required this.changeBtc,
    required this.changeUsd,
    required this.confirmations,
    this.assetKey,
    this.reserve,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);

  @override
  List<Object?> get props => [
        assetId,
        symbol,
        name,
        iconUrl,
        balance,
        destination,
        tag,
        priceBtc,
        priceUsd,
        chainId,
        changeBtc,
        changeUsd,
        confirmations,
        assetKey,
        reserve,
      ];
}
