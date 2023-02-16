import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_precision.g.dart';

@JsonSerializable()
class AssetPrecision with EquatableMixin {
  AssetPrecision({
    required this.assetId,
    required this.chainId,
    required this.precision,
  });

  factory AssetPrecision.fromJson(Map<String, dynamic> json) =>
      _$AssetPrecisionFromJson(json);

  Map<String, dynamic> toJson() => _$AssetPrecisionToJson(this);

  @JsonKey(name: 'asset_id')
  String assetId;
  @JsonKey(name: 'chain_id')
  String chainId;
  int precision;

  @override
  List<Object?> get props => [assetId, chainId, precision];
}
