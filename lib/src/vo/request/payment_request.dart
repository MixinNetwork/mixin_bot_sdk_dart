import 'package:json_annotation/json_annotation.dart';

import 'raw_transaction_request.dart';

part 'payment_request.g.dart';

@JsonSerializable()
class PaymentRequest {
  PaymentRequest({
    this.assetId,
    this.amount,
    this.addressId,
    this.opponentId,
    this.opponentKey,
    this.opponentMultisig,
    this.pin,
    this.pinBase64,
    this.traceId,
    this.memo,
    this.destination,
    this.rawPaymentUrl,
  });

  factory PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$PaymentRequestFromJson(json);

  @JsonKey(name: 'asset_id')
  final String? assetId;

  @JsonKey(name: 'address_id')
  final String? addressId;

  @JsonKey(name: 'opponent_id')
  final String? opponentId;

  @JsonKey(name: 'opponent_key')
  final String? opponentKey;

  @JsonKey(name: 'opponent_multisig')
  final OpponentMultisig? opponentMultisig;

  @JsonKey(name: 'amount')
  final String? amount;

  @JsonKey(name: 'pin')
  final String? pin;

  @JsonKey(name: 'pin_base64')
  final String? pinBase64;

  @JsonKey(name: 'trace_id')
  final String? traceId;

  @JsonKey(name: 'memo')
  final String? memo;

  final String? destination;

  @JsonKey(name: 'raw_payment_url')
  final String? rawPaymentUrl;

  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}
