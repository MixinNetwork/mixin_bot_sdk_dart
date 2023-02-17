import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_request.g.dart';

@JsonSerializable()
class WithdrawalRequest with EquatableMixin {
  WithdrawalRequest({
    required this.addressId,
    required this.amount,
    required this.pin,
    required this.traceId,
    this.memo,
    this.fee,
    this.assetId,
    this.destination,
    this.tag,
  });

  factory WithdrawalRequest.fromJson(Map<String, dynamic> json) =>
      _$WithdrawalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalRequestToJson(this);

  @JsonKey(name: 'address_id')
  String addressId;
  @JsonKey(name: 'amount')
  String amount;
  @JsonKey(name: 'pin')
  String pin;
  @JsonKey(name: 'trace_id')
  String traceId;
  @JsonKey(name: 'memo')
  String? memo;
  @JsonKey(name: 'fee')
  String? fee;
  @JsonKey(name: 'asset_id')
  String? assetId;
  String? destination;
  String? tag;

  @override
  List<Object?> get props => [
        addressId,
        amount,
        pin,
        traceId,
        memo,
        fee,
        assetId,
        destination,
        tag,
      ];
}
