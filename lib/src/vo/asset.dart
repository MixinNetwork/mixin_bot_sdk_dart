import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'deposit_entry.dart';

part 'asset.g.dart';

@JsonSerializable()
class Asset with EquatableMixin {
  Asset({
    required this.assetId,
    required this.symbol,
    required this.name,
    required this.displaySymbol,
    required this.displayName,
    required this.iconUrl,
    required this.balance,
    required this.priceBtc,
    required this.priceUsd,
    required this.chainId,
    required this.changeBtc,
    required this.changeUsd,
    required this.confirmations,
    required this.feeAssetId,
    required this.precision,
    this.tag,
    this.assetKey,
    this.reserve,
    this.depositEntries,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  Map<String, dynamic> toJson() => _$AssetToJson(this);

  @JsonKey(name: 'asset_id')
  final String assetId;
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
  @JsonKey(name: 'balance')
  final String balance;
  @JsonKey(name: 'tag')
  final String? tag;
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
  final String? assetKey;
  @JsonKey(name: 'reserve')
  final String? reserve;
  @JsonKey(name: 'deposit_entries')
  final List<DepositEntry>? depositEntries;
  @JsonKey(name: 'fee_asset_id')
  final String? feeAssetId;
  @JsonKey(name: 'precision')
  final int precision;

  @override
  List<Object?> get props => [
    assetId,
    symbol,
    name,
    displaySymbol,
    displayName,
    iconUrl,
    balance,
    tag,
    priceBtc,
    priceUsd,
    chainId,
    changeBtc,
    changeUsd,
    confirmations,
    assetKey,
    reserve,
    depositEntries,
    feeAssetId,
    precision,
  ];
}
