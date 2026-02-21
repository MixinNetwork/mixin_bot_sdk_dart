import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'raw_transaction_request.g.dart';

@JsonSerializable()
class RawTransactionRequest with EquatableMixin {
  RawTransactionRequest({
    required this.assetId,
    required this.opponentMultisig,
    required this.amount,
    required this.pin,
    this.traceId,
    this.memo,
  });

  factory RawTransactionRequest.fromJson(Map<String, dynamic> json) =>
      _$RawTransactionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RawTransactionRequestToJson(this);

  @JsonKey(name: 'asset_id')
  final String assetId;
  @JsonKey(name: 'opponent_multisig')
  final OpponentMultisig opponentMultisig;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'pin')
  final String pin;
  @JsonKey(name: 'trace_id')
  final String? traceId;
  @JsonKey(name: 'memo')
  final String? memo;

  @override
  List<Object?> get props => [
    assetId,
    opponentMultisig,
    amount,
    pin,
    traceId,
    memo,
  ];
}

@JsonSerializable()
class OpponentMultisig with EquatableMixin {
  OpponentMultisig({
    required this.receivers,
    required this.threshold,
  });

  factory OpponentMultisig.fromJson(Map<String, dynamic> json) =>
      _$OpponentMultisigFromJson(json);

  Map<String, dynamic> toJson() => _$OpponentMultisigToJson(this);

  @JsonKey(name: 'receivers')
  final List<String> receivers;
  @JsonKey(name: 'threshold')
  final int threshold;

  @override
  List<Object?> get props => [
    receivers,
    threshold,
  ];
}
