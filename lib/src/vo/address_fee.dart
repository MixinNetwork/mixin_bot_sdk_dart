import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_fee.g.dart';

@JsonSerializable()
class AddressFee with EquatableMixin {
  AddressFee({
    required this.destination,
    required this.assetId,
    required this.fee,
    this.tag,
  });

  factory AddressFee.fromJson(Map<String, dynamic> json) =>
      _$AddressFeeFromJson(json);

  Map<String, dynamic> toJson() => _$AddressFeeToJson(this);

  final String destination;
  final String? tag;
  @JsonKey(name: 'fee_asset_id')
  final String assetId;
  final String fee;

  @override
  List<Object?> get props => [destination, tag, assetId, fee];
}
