import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'asset_fee.g.dart';

@JsonSerializable()
class AssetFee with EquatableMixin {
  AssetFee({
    required this.type,
    required this.assetId,
    required this.amount,
  });

  factory AssetFee.fromJson(Map<String, dynamic> json) =>
      _$AssetFeeFromJson(json);

  Map<String, dynamic> toJson() => _$AssetFeeToJson(this);

  @JsonKey(name: 'type')
  String type;
  @JsonKey(name: 'asset_id')
  String assetId;
  @JsonKey(name: 'amount')
  String amount;

  @override
  List<Object> get props => [type, assetId, amount];
}
