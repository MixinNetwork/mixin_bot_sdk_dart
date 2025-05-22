import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address with EquatableMixin {
  Address({
    required this.addressId,
    required this.type,
    required this.assetId,
    required this.destination,
    required this.label,
    required this.updatedAt,
    required this.reserve,
    required this.fee,
    required this.tag,
    required this.dust,
    required this.feeAssetId,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @JsonKey(name: 'address_id')
  final String addressId;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'asset_id')
  final String assetId;
  @JsonKey(name: 'destination')
  final String destination;
  @JsonKey(name: 'label')
  final String label;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'reserve')
  final String reserve;
  @JsonKey(name: 'fee')
  final String fee;
  @JsonKey(name: 'tag')
  final String? tag;
  @JsonKey(name: 'dust')
  final String dust;

  @JsonKey(name: 'fee_asset_id')
  final String feeAssetId;

  @override
  List<Object?> get props => [
        addressId,
        type,
        assetId,
        destination,
        label,
        updatedAt,
        reserve,
        fee,
        tag,
        dust,
        feeAssetId,
      ];
}
