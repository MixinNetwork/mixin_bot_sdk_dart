import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_request.g.dart';

@JsonSerializable()
class TransferRequest with EquatableMixin {
  TransferRequest({
    required this.assetId,
    required this.amount,
    this.opponentId,
    this.pin,
    this.traceId,
    this.memo,
    this.addressId,
  });

  factory TransferRequest.fromJson(Map<String, dynamic> json) =>
      _$TransferRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransferRequestToJson(this);

  @JsonKey(name: 'asset_id')
  final String assetId;
  @JsonKey(name: 'opponent_id')
  final String? opponentId;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'pin')
  final String? pin;
  @JsonKey(name: 'trace_id')
  final String? traceId;
  @JsonKey(name: 'memo')
  final String? memo;
  @JsonKey(name: 'address_id')
  final String? addressId;

  @override
  List<Object?> get props => [
    assetId,
    opponentId,
    amount,
    pin,
    traceId,
    memo,
    addressId,
  ];
}
