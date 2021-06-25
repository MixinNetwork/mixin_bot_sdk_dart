// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'raw_transaction_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawTransactionRequest _$RawTransactionRequestFromJson(
    Map<String, dynamic> json) {
  return RawTransactionRequest(
    assetId: json['asset_id'] as String,
    opponentMultisig: OpponentMultisig.fromJson(
        json['opponent_multisig'] as Map<String, dynamic>),
    amount: json['amount'] as String,
    pin: json['pin'] as String,
    traceId: json['trace_id'] as String?,
    memo: json['memo'] as String?,
  );
}

Map<String, dynamic> _$RawTransactionRequestToJson(
        RawTransactionRequest instance) =>
    <String, dynamic>{
      'asset_id': instance.assetId,
      'opponent_multisig': instance.opponentMultisig,
      'amount': instance.amount,
      'pin': instance.pin,
      'trace_id': instance.traceId,
      'memo': instance.memo,
    };

OpponentMultisig _$OpponentMultisigFromJson(Map<String, dynamic> json) {
  return OpponentMultisig(
    receivers:
        (json['receivers'] as List<dynamic>).map((e) => e as String).toList(),
    threshold: json['threshold'] as int,
  );
}

Map<String, dynamic> _$OpponentMultisigToJson(OpponentMultisig instance) =>
    <String, dynamic>{
      'receivers': instance.receivers,
      'threshold': instance.threshold,
    };
